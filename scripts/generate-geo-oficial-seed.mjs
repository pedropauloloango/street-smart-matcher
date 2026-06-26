/**
 * Gera migration SQL da base oficial GeoBairros CG (Campo Grande-MS).
 * Uso: node scripts/generate-geo-oficial-seed.mjs
 */
import { writeFileSync } from "fs";
import { fileURLToPath } from "url";
import { dirname, join } from "path";
import { BASE, OUTDATED_BAIRROS } from "./geo-base-cg.mjs";
import { normalizeGeo } from "./geo-normalize.mjs";

const __dirname = dirname(fileURLToPath(import.meta.url));

function esc(s) {
  return s.replace(/'/g, "''");
}

const OUTDATED = OUTDATED_BAIRROS;

let sql = `-- Base oficial GeoBairros CG — Campo Grande-MS (7 regiões urbanas, ${BASE.length} bairros oficiais)
-- Gerado por scripts/generate-geo-oficial-seed.mjs

-- Desativa entradas do seed de amostra substituídas pela base oficial
UPDATE public.geo_bairros SET ativo = false
WHERE bairro_oficial IN (${OUTDATED.map((b) => `'${esc(b)}'`).join(", ")});

`;

// Bairros
const bairroValues = BASE.map((x) => `('${esc(x.bairro)}', '${esc(x.regiao)}')`).join(",\n  ");
sql += `INSERT INTO public.geo_bairros (bairro_oficial, regiao_urbana) VALUES
  ${bairroValues}
ON CONFLICT (bairro_oficial) DO UPDATE SET
  regiao_urbana = EXCLUDED.regiao_urbana,
  ativo = true;

`;

// Parcelamentos per bairro
for (const { bairro, parcelamentos } of BASE) {
  const vals = parcelamentos.map((p) => `('${esc(p)}')`).join(", ");
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

// Sinônimos: parcelamentos + bairro oficial
const sinonimos = new Map(); // nome_normalizado -> { nome_informado, bairro }
for (const { bairro, parcelamentos } of BASE) {
  const add = (nome) => {
    const norm = normalizeGeo(nome);
    if (!norm) return;
    if (!sinonimos.has(norm)) sinonimos.set(norm, { nome_informado: nome, bairro });
  };
  add(bairro);
  for (const p of parcelamentos) add(p);
  // variações comuns
  add(`Bairro ${bairro}`);
  if (bairro.startsWith("Jardim ")) add(bairro.replace("Jardim ", "Jd "));
}

for (const [norm, { nome_informado, bairro }] of sinonimos) {
  sql += `INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, '${esc(nome_informado)}', '${esc(norm)}', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = '${esc(bairro)}' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

`;
}

const outPath = join(__dirname, "../supabase/migrations/20260625190000_geo_bairros_oficial_cg.sql");
writeFileSync(outPath, sql);
console.log(`Gerado: ${outPath}`);
console.log(`Bairros: ${BASE.length}, Sinônimos: ${sinonimos.size}`);
