// Lógica de correspondência: exata → sinônimo → similaridade
import { supabase } from "@/integrations/supabase/client";
import { normalizeGeo } from "./normalize";
import { similarity } from "./levenshtein";
import type { ResultRow } from "./store";

export type Bairro = {
  id: string;
  bairro_oficial: string;
  regiao_urbana: string | null;
};

export type Parcelamento = {
  id: string;
  bairro_id: string;
  parcelamento: string;
};

export type Sinonimo = {
  id: string;
  bairro_id: string;
  nome_normalizado: string;
  nome_informado: string;
};

export type GeoDataset = {
  bairros: Bairro[];
  bairrosByNorm: Map<string, Bairro>;
  parcByBairro: Map<string, Parcelamento[]>;
  sinByNorm: Map<string, Sinonimo>;
};

export async function loadGeoDataset(): Promise<GeoDataset> {
  const [b, p, s] = await Promise.all([
    supabase.from("geo_bairros").select("id,bairro_oficial,regiao_urbana").eq("ativo", true),
    supabase.from("geo_parcelamentos").select("id,bairro_id,parcelamento").eq("ativo", true),
    supabase.from("geo_sinonimos").select("id,bairro_id,nome_normalizado,nome_informado"),
  ]);
  const bairros = (b.data ?? []) as Bairro[];
  const parcelamentos = (p.data ?? []) as Parcelamento[];
  const sinonimos = (s.data ?? []) as Sinonimo[];

  const bairrosByNorm = new Map<string, Bairro>();
  for (const x of bairros) bairrosByNorm.set(normalizeGeo(x.bairro_oficial), x);

  const parcByBairro = new Map<string, Parcelamento[]>();
  for (const x of parcelamentos) {
    const arr = parcByBairro.get(x.bairro_id) ?? [];
    arr.push(x);
    parcByBairro.set(x.bairro_id, arr);
  }

  const sinByNorm = new Map<string, Sinonimo>();
  for (const x of sinonimos) sinByNorm.set(x.nome_normalizado, x);

  return { bairros, bairrosByNorm, parcByBairro, sinByNorm };
}

export function matchOne(original: string, ds: GeoDataset, line: number): ResultRow {
  const base: ResultRow = {
    linha: line,
    bairro_original: original,
    bairro_oficial: null,
    parcelamento: null,
    regiao_urbana: null,
    status_match: "nao_encontrado",
    percentual_confianca: 0,
  };
  const norm = normalizeGeo(original);
  if (!norm) return base;

  // 1) Exata
  let bairro = ds.bairrosByNorm.get(norm);
  if (bairro) {
    return fill(base, bairro, ds, "encontrado", 100);
  }

  // 2) Sinônimo
  const sin = ds.sinByNorm.get(norm);
  if (sin) {
    const target = ds.bairros.find((x) => x.id === sin.bairro_id);
    if (target) return fill(base, target, ds, "encontrado", 100);
  }

  // 3) Similaridade
  let best: { b: Bairro; score: number } | null = null;
  for (const b of ds.bairros) {
    const score = similarity(norm, normalizeGeo(b.bairro_oficial));
    if (!best || score > best.score) best = { b, score };
  }
  // Também testar contra sinônimos
  for (const [k, v] of ds.sinByNorm) {
    const score = similarity(norm, k);
    if (!best || score > best.score) {
      const target = ds.bairros.find((x) => x.id === v.bairro_id);
      if (target) best = { b: target, score };
    }
  }

  if (best && best.score >= 85) {
    return fill(base, best.b, ds, "similaridade", best.score);
  }
  return { ...base, percentual_confianca: best?.score ?? 0 };
}

function fill(base: ResultRow, b: Bairro, ds: GeoDataset, status: ResultRow["status_match"], score: number): ResultRow {
  const parc = ds.parcByBairro.get(b.id) ?? [];
  return {
    ...base,
    bairro_oficial: b.bairro_oficial,
    regiao_urbana: b.regiao_urbana,
    parcelamento: parc.map((p) => p.parcelamento).join(", ") || null,
    status_match: status,
    percentual_confianca: score,
  };
}
