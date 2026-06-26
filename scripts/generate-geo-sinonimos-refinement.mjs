/**
 * Gera migration com sinônimos refinados para conciliar grafias comuns de Campo Grande-MS.
 * Uso: node scripts/generate-geo-sinonimos-refinement.mjs
 */
import { writeFileSync } from "fs";
import { fileURLToPath } from "url";
import { dirname, join } from "path";
import { BASE } from "./geo-base-cg.mjs";
import { normalizeGeo } from "./geo-normalize.mjs";

const __dirname = dirname(fileURLToPath(import.meta.url));

function esc(s) {
  return s.replace(/'/g, "''");
}

/** Prefixos com abreviações usadas em planilhas e cadastros municipais. */
const PREFIX_VARIANTS = [
  ["Jardim ", ["JD ", "Jd ", "jd "]],
  ["Vila ", ["VL ", "Vl ", "vl "]],
  ["Residencial ", ["RES ", "Res ", "res "]],
  ["Conjunto Habitacional ", ["COHAB ", "Cohab ", "CH "]],
  ["Conjunto ", ["CJ ", "Conj ", "conj "]],
  ["Loteamento ", ["LT ", "Lot ", "LOT "]],
  ["Parque ", ["PQ ", "Pq "]],
  ["Portal ", ["Port ", "PORT "]],
  ["Chácara ", ["CH ", "Chacara ", "CHACARA "]],
  ["Chacara ", ["CH ", "CHACARA "]],
];

function nameVariants(name) {
  const out = new Set([name]);
  for (const [prefix, abbrevs] of PREFIX_VARIANTS) {
    if (!name.startsWith(prefix)) continue;
    const rest = name.slice(prefix.length);
    out.add(rest);
    for (const ab of abbrevs) out.add(ab + rest);
  }
  if (name.startsWith("Dr. ")) out.add(name.slice(4));
  if (name.startsWith("Dr ")) out.add(name.slice(3));
  return [...out];
}

/**
 * Sinônimos manuais de fontes públicas (Planurb/SISGRAN, cadastro imobiliário, grafias comuns).
 * @type {[string, string, number][]} [nome_informado, bairro_oficial, confianca]
 */
const MANUAL = [
  ["Jardim Amambai", "Amambai", 95],
  ["JD Amambai", "Amambai", 95],
  ["Vila Nasser", "Nasser", 100],
  ["VL Nasser", "Nasser", 100],
  ["Nasser", "Nasser", 100],
  ["Res Damha", "Maria Aparecida Pedrossian", 95],
  ["Residencial Damha", "Maria Aparecida Pedrossian", 95],
  ["DAMHA", "Maria Aparecida Pedrossian", 90],
  ["Res Dahma", "Tiradentes", 95],
  ["Residencial Dahma", "Tiradentes", 95],
  ["DAHMA", "Tiradentes", 90],
  ["Coophavila", "Coophavila II", 95],
  ["COOPHAVILA", "Coophavila II", 95],
  ["COOPHAVILA 2", "Coophavila II", 100],
  ["COOPHAVILA II", "Coophavila II", 100],
  ["Coop Havila", "Coophavila II", 90],
  ["Conjunto Habitacional Coophavila", "Coophavila II", 95],
  ["Marambaia", "Coophavila II", 95],
  ["Taveiropolis", "Taveirópolis", 100],
  ["Vila Taveiropolis", "Taveirópolis", 100],
  ["Seminario", "Seminário", 100],
  ["Jd Seminario", "Seminário", 100],
  ["Jardim Seminario", "Seminário", 100],
  ["Jardim Veneza", "Veraneio", 85],
  ["JD Veneza", "Veraneio", 85],
  ["Veneza", "Veraneio", 80],
  ["Guanandi", "Guanandi", 95],
  ["GUANANDI", "Guanandi", 95],
  ["Cohab Universitária", "Universitário", 100],
  ["COHAB UNIVERSITARIA", "Universitário", 100],
  ["Portal Caioba", "Caiobá", 95],
  ["Portal Caiobá I", "Caiobá", 95],
  ["Portal Caiobá II", "Caiobá", 95],
  ["Portal Caiobá III", "Caiobá", 95],
  ["Alphaville", "Veraneio", 95],
  ["Residencial Alphaville", "Veraneio", 95],
  ["Itanhangá", "Itanhangá (Parte Sul)", 95],
  ["Itanhangá Sul", "Itanhangá (Parte Sul)", 95],
  ["Jardim Itanhangá Sul", "Itanhangá (Parte Sul)", 90],
  ["Santa Fé Centro", "Santa Fé (Parte Centro)", 95],
  ["Jardim Flamboyant", "Tiradentes", 90],
  ["Flamboyant", "Tiradentes", 85],
  ["Bela Vista", "Taveirópolis", 90],
  ["TV Morena", "Tv Morena", 100],
  ["Tv Morena", "Tv Morena", 100],
  ["Aero Rancho", "Aero Rancho", 100],
  ["Conjunto Habitacional Aero Rancho", "Aero Rancho", 100],
  ["CH Aero Rancho", "Aero Rancho", 100],
  ["Los Angeles", "Los Angeles", 100],
  ["Rita Vieira", "Rita Vieira", 100],
  ["Nova Lima", "Nova Lima", 100],
  ["Moreninha", "Moreninha", 100],
  ["Universitário", "Universitário", 100],
  ["Jardim Universitário", "Universitário", 100],
  ["Green Park", "Chácara dos Poderes", 95],
  ["West Park", "Santa Fé (Parte Centro)", 90],
  ["West Park Panamá", "Panamá", 90],
  ["Residencial West Park", "Panamá", 90],
  ["Santa Emilia", "São Conrado", 95],
  ["Santa Emília", "São Conrado", 100],
  ["Siriema", "Nasser", 95],
  ["Oiti", "Maria Aparecida Pedrossian", 95],
  ["Assaf Trad", "Tiradentes", 95],
  ["Tamandaré", "Seminário", 90],
  ["Tamandare", "Seminário", 90],
  ["Carandá Bosque", "Carandá", 95],
  ["Caranda Bosque", "Carandá", 90],
  ["Núcleo Industrial", "Núcleo Industrial", 100],
  ["Polo Empresarial", "Núcleo Industrial", 90],
  ["Indubrasil", "Núcleo Industrial", 95],
  ["Planta Original", "Centro", 90],
  ["Vila Cidade", "Centro", 95],
  ["Rui Barbosa", "Centro", 95],
  ["Base Aérea", "Planalto", 95],
  ["Base Aerea", "Planalto", 95],
  ["Vila Militar", "Amambai", 90],
  ["Vila Militar da Aeronáutica", "Planalto", 95],
  ["IPÊ", "Jacy", 85],
  ["IPE", "Jacy", 85],
  ["Segredo", "Monte Castelo", 90],
  ["Mata do Segredo", "Mata do Segredo", 100],
  ["Chácara dos Poderes", "Chácara dos Poderes", 100],
  ["Chacara dos Poderes", "Chácara dos Poderes", 100],
  ["Parque dos Poderes", "Veraneio", 90],
  ["Novo Horizonte", "Estrela Dalva", 85],
  ["Novo Horizonte Vilasboas", "Vilasboas", 90],
  ["Zé Pereira", "Panamá", 95],
  ["Ze Pereira", "Panamá", 95],
  ["Romano", "Popular", 95],
  ["Zapran", "Sobrinho", 95],
  ["Promorar", "Piratininga", 95],
  ["Vegas", "Los Angeles", 95],
  ["Marajoara", "Centro Oeste", 95],
  ["Mansur", "Carlota", 95],
  ["Kaveira", "Margarida", 95],
  ["Sóter", "Mata do Jacinto", 95],
  ["Soter", "Mata do Jacinto", 95],
];

/** @type {Map<string, { nome_informado: string, bairro: string, confianca: number }>} */
const sinonimos = new Map();

function add(nome, bairro, confianca = 100, tipo = "refinamento") {
  const norm = normalizeGeo(nome);
  if (!norm || !bairro) return;
  const prev = sinonimos.get(norm);
  if (!prev || confianca >= prev.confianca) {
    sinonimos.set(norm, { nome_informado: nome, bairro, confianca, tipo });
  }
}

// Variantes automáticas a partir da base oficial
for (const { bairro, parcelamentos } of BASE) {
  add(bairro, bairro, 100, "oficial");
  add(`Bairro ${bairro}`, bairro, 100, "oficial");
  for (const variant of nameVariants(bairro)) add(variant, bairro, 100, "oficial");

  for (const p of parcelamentos) {
    for (const variant of nameVariants(p)) add(variant, bairro, 100, "oficial");
    add(p, bairro, 100, "oficial");
  }
}

// Sinônimos manuais (grafias comuns / typos / nomes de empreendimentos)
for (const [nome, bairro, conf] of MANUAL) {
  add(nome, bairro, conf, "refinamento");
  for (const variant of nameVariants(nome)) add(variant, bairro, conf, "refinamento");
}

let sql = `-- Refinamento de sinônimos GeoBairros CG — Campo Grande-MS
-- Grafias comuns, abreviações e empreendimentos (Planurb/SISGRAN + cadastro municipal)
-- Gerado por scripts/generate-geo-sinonimos-refinement.mjs

`;

for (const [norm, { nome_informado, bairro, confianca, tipo }] of sinonimos) {
  sql += `INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, '${esc(nome_informado)}', '${esc(norm)}', '${esc(tipo)}', ${confianca}
FROM public.geo_bairros b
WHERE b.bairro_oficial = '${esc(bairro)}' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

`;
}

const outPath = join(__dirname, "../supabase/migrations/20260625200000_geo_sinonimos_refinamento.sql");
writeFileSync(outPath, sql);
console.log(`Gerado: ${outPath}`);
console.log(`Sinônimos refinados: ${sinonimos.size}`);
