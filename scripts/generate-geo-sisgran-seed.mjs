/**
 * Gera migration SQL a partir da planilha oficial SISGRAN CG.
 * Uso: node scripts/generate-geo-sisgran-seed.mjs
 */
import { writeFileSync, existsSync } from "fs";
import { join, dirname } from "path";
import { fileURLToPath } from "url";
import XLSX from "xlsx";
import { normalizeGeo } from "./geo-normalize.mjs";

const __dirname = dirname(fileURLToPath(import.meta.url));

const XLSX_PATHS = [
  join(__dirname, "data/bairros_oficiais_sisgran.xlsx"),
  "c:/Users/pedro.loango/Downloads/bairros_oficiais_sisgran.xlsx",
];

const REGIAO_MAP = {
  ANHANDUIZINHO: "Anhanduizinho",
  BANDEIRA: "Bandeira",
  CENTRO: "Centro",
  IMBIRUSSU: "Imbirussu",
  LAGOA: "Lagoa",
  PROSA: "Prosa",
  SEGREDO: "Segredo",
  RURAL: "Rural",
};

const PARTICLES = new Set(["de", "da", "do", "das", "dos", "e"]);

function esc(s) {
  return String(s).replace(/'/g, "''");
}

/** Remove sufixo " - SEÇÃO …" / " - 2ª SEÇÃO - PARTE" do nome do parcelamento. */
export function stripSecaoParcelamento(raw) {
  const s = String(raw).trim();
  if (!s) return s;
  const parts = s.split(/\s*-\s*/);
  const out = [];
  for (const p of parts) {
    if (/se[cç][aã]o/i.test(p)) break;
    if (/^\d+\s*[ªº]?\s*se[cç][aã]o/i.test(p)) break;
    if (/^parte$/i.test(p.trim())) break;
    out.push(p.trim());
  }
  const joined = out.join(" - ").trim();
  return joined || s;
}

function titleCaseBairro(raw) {
  let s = String(raw).trim();
  if (!s) return s;
  s = s.replace(/^DR\.?\s+/i, "Dr. ");
  s = s.replace(/^TV\.?\s+/i, "Tv ");
  return s
    .split(/\s+/)
    .map((word, i) => {
      const w = word.toLowerCase();
      if (i > 0 && PARTICLES.has(w)) return w;
      if (/^(ii|iii|iv|vi{0,3}|ix|x{1,3})$/i.test(word)) return word.toUpperCase();
      if (word.length <= 3 && word === word.toUpperCase() && /[A-Z]/.test(word)) {
        return word.charAt(0) + word.slice(1).toLowerCase();
      }
      return w.charAt(0).toUpperCase() + w.slice(1);
    })
    .join(" ");
}

function mapRegiao(raw) {
  const key = String(raw ?? "")
    .trim()
    .toUpperCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "");
  return REGIAO_MAP[key] ?? titleCaseBairro(raw);
}

function loadRows() {
  const path = XLSX_PATHS.find((p) => existsSync(p));
  if (!path) throw new Error("Planilha SISGRAN não encontrada em scripts/data/");
  const wb = XLSX.readFile(path);
  return XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[0]], { defval: "" });
}

function buildBase(rows) {
  /** @type {Map<string, { bairro: string, regiao: string, parcelamentos: Set<string> }>} */
  const map = new Map();

  const add = (bairroRaw, parcRaw, regiaoRaw) => {
    const parc = String(parcRaw ?? "").trim();
    if (!parc) return;

    let bairroKey = String(bairroRaw ?? "").trim();
    if (!bairroKey || bairroKey === "-" || bairroKey.toLowerCase() === "nenhum filtro aplicado") {
      bairroKey = parc;
    }

    const bairro = titleCaseBairro(bairroKey);
    const regiao = mapRegiao(regiaoRaw);
    if (!map.has(bairro)) map.set(bairro, { bairro, regiao, parcelamentos: new Set() });
    const entry = map.get(bairro);
    if (entry.regiao !== regiao && regiao) entry.regiao = regiao;
    entry.parcelamentos.add(parc);
  };

  for (const r of rows) {
    add(r.BAIRRO ?? r.bairro, r.PARCELAMENTO ?? r.parcelamento, r["REGIÃO URBANA"] ?? r.regiao);
  }

  return [...map.values()].sort((a, b) => a.bairro.localeCompare(b.bairro, "pt-BR"));
}

function collectSinonimos(base) {
  /** @type {Map<string, { nome_informado: string, bairro: string }>} */
  const sin = new Map();
  const officialNorms = new Map(base.map((b) => [normalizeGeo(b.bairro), b.bairro]));

  const add = (nome, bairro) => {
    const n = String(nome).trim();
    if (!n) return;
    const norm = normalizeGeo(n);
    if (!norm) return;
    if (!sin.has(norm)) sin.set(norm, { nome_informado: n, bairro });
  };

  for (const { bairro, parcelamentos } of base) {
    add(bairro, bairro);
    add(`Bairro ${bairro}`, bairro);
    if (bairro.startsWith("Jardim ")) add(bairro.replace("Jardim ", "Jd "), bairro);

    for (const p of parcelamentos) {
      add(p, bairro);
      const semSecao = stripSecaoParcelamento(p);
      if (semSecao && semSecao !== p) {
        const semNorm = normalizeGeo(semSecao);
        const donoOficial = officialNorms.get(semNorm);
        // Não roubar sinônimo de outro bairro oficial (ex.: UNIVERSITÁRIO)
        if (donoOficial && donoOficial !== bairro) continue;
        add(semSecao, bairro);
      }
    }
  }

  return sin;
}

function chunk(arr, size) {
  const out = [];
  for (let i = 0; i < arr.length; i += size) out.push(arr.slice(i, i + size));
  return out;
}

function main() {
  const rows = loadRows();
  const base = buildBase(rows);
  const sinonimos = collectSinonimos(base);
  const bairroNames = base.map((b) => b.bairro);

  let sql = `-- Base oficial SISGRAN CG — ${base.length} bairros, ${rows.length} parcelamentos na planilha
-- Gerado por scripts/generate-geo-sisgran-seed.mjs

-- Desativa bairros que saíram da lista oficial
UPDATE public.geo_bairros SET ativo = false
WHERE bairro_oficial NOT IN (${bairroNames.map((b) => `'${esc(b)}'`).join(", ")});

`;

  const bairroValues = base.map((x) => `('${esc(x.bairro)}', '${esc(x.regiao)}')`).join(",\n  ");
  sql += `INSERT INTO public.geo_bairros (bairro_oficial, regiao_urbana) VALUES
  ${bairroValues}
ON CONFLICT (bairro_oficial) DO UPDATE SET
  regiao_urbana = EXCLUDED.regiao_urbana,
  ativo = true;

`;

  sql += `-- Recria parcelamentos conforme SISGRAN
UPDATE public.geo_parcelamentos SET ativo = false
WHERE bairro_id IN (SELECT id FROM public.geo_bairros WHERE ativo = true);

`;

  for (const { bairro, parcelamentos } of base) {
    const list = [...parcelamentos].sort((a, b) => a.localeCompare(b, "pt-BR"));
    if (!list.length) continue;
    const vals = list.map((p) => `('${esc(p)}')`).join(", ");
    sql += `INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ${vals}) AS v(parcelamento)
WHERE b.bairro_oficial = '${esc(bairro)}' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

`;
  }

  sql += `-- Sinônimos oficiais SISGRAN (inclui nome sem "Seção" quando parcelamento tem seção)
DELETE FROM public.geo_sinonimos WHERE tipo_correspondencia IN ('oficial', 'sisgran');

`;

  const sinEntries = [...sinonimos.entries()].sort((a, b) => a[0].localeCompare(b[0]));
  for (const batch of chunk(sinEntries, 80)) {
    const values = batch
      .map(([norm, { nome_informado, bairro }]) => `('${esc(bairro)}', '${esc(nome_informado)}', '${esc(norm)}')`)
      .join(",\n  ");
    sql += `INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ${values}
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

`;
  }

  const outPath = join(__dirname, "../supabase/migrations/20260628140000_geo_sisgran_oficial.sql");
  writeFileSync(outPath, sql);
  console.log(`Gerado: ${outPath}`);
  console.log(`Bairros: ${base.length}, Parcelamentos: ${rows.length}, Sinônimos: ${sinonimos.size}`);
}

main();
