// Lógica de correspondência: exata → sinônimo → parcelamento → similaridade

import { supabase } from "@/integrations/supabase/client";

import { fetchAllRows } from "./api";

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



export type ParcMatch = {

  bairro_id: string;

  parcelamento: string;

};



export type GeoDataset = {

  bairros: Bairro[];

  bairrosById: Map<string, Bairro>;

  bairrosByNorm: Map<string, Bairro>;

  parcByBairro: Map<string, Parcelamento[]>;

  parcByNorm: Map<string, ParcMatch>;

  sinByNorm: Map<string, Sinonimo>;

};



function parcMatchPriority(parcName: string, bairroOficial: string): number {

  let score = 0;

  if (!/\(parte\)|\(fração\)|\(fracao\)/i.test(parcName)) score += 10;

  const np = normalizeGeo(parcName);

  const nb = normalizeGeo(bairroOficial);

  if (np === `VILA ${nb}` || np === `JARDIM ${nb}` || np === nb) score += 15;

  return score;

}



export async function loadGeoDataset(): Promise<GeoDataset> {

  const [bairros, parcelamentos, sinonimos] = await Promise.all([

    fetchAllRows<Bairro>((from, to) =>

      supabase.from("geo_bairros").select("id,bairro_oficial,regiao_urbana").eq("ativo", true).range(from, to),

    ),

    fetchAllRows<Parcelamento>((from, to) =>

      supabase.from("geo_parcelamentos").select("id,bairro_id,parcelamento").eq("ativo", true).range(from, to),

    ),

    fetchAllRows<Sinonimo>((from, to) =>

      supabase.from("geo_sinonimos").select("id,bairro_id,nome_normalizado,nome_informado").range(from, to),

    ),

  ]);



  const bairrosById = new Map<string, Bairro>();

  const bairrosByNorm = new Map<string, Bairro>();

  for (const x of bairros) {

    bairrosById.set(x.id, x);

    bairrosByNorm.set(normalizeGeo(x.bairro_oficial), x);

  }



  const parcByBairro = new Map<string, Parcelamento[]>();

  const parcByNorm = new Map<string, ParcMatch>();

  const bairroOficialById = new Map(bairros.map((b) => [b.id, b.bairro_oficial]));



  for (const x of parcelamentos) {

    const arr = parcByBairro.get(x.bairro_id) ?? [];

    arr.push(x);

    parcByBairro.set(x.bairro_id, arr);



    const norm = normalizeGeo(x.parcelamento);

    if (!norm) continue;

    const bairroOficial = bairroOficialById.get(x.bairro_id) ?? "";

    const candidate: ParcMatch = { bairro_id: x.bairro_id, parcelamento: x.parcelamento };

    const existing = parcByNorm.get(norm);

    if (!existing) {

      parcByNorm.set(norm, candidate);

      continue;

    }

    const existingBairro = bairroOficialById.get(existing.bairro_id) ?? "";

    if (parcMatchPriority(x.parcelamento, bairroOficial) > parcMatchPriority(existing.parcelamento, existingBairro)) {

      parcByNorm.set(norm, candidate);

    }

  }



  const sinByNorm = new Map<string, Sinonimo>();

  for (const x of sinonimos) sinByNorm.set(x.nome_normalizado, x);



  return { bairros, bairrosById, bairrosByNorm, parcByBairro, parcByNorm, sinByNorm };

}



function findParcelamentoForNorm(bairroId: string, norm: string, ds: GeoDataset): string | null {

  const parcList = ds.parcByBairro.get(bairroId) ?? [];

  const hit = parcList.find((p) => normalizeGeo(p.parcelamento) === norm);

  return hit?.parcelamento ?? null;

}



const BAIRRO_PREFIXES = new Set([

  "JARDIM", "VILA", "RESIDENCIAL", "BAIRRO", "CONJUNTO", "PARQUE", "CHACARA", "PORTAL", "COHAB",

]);



/** Tenta conciliar pelo nome do bairro oficial quando não houve match de parcelamento. */

function matchBairroOficial(norm: string, ds: GeoDataset): Bairro | null {

  const candidates = new Set<string>([norm]);

  const tokens = norm.split(/\s+/).filter(Boolean);

  if (tokens.length > 1 && BAIRRO_PREFIXES.has(tokens[0]!)) {

    candidates.add(tokens.slice(1).join(" "));

  }



  for (const c of candidates) {

    const hit = ds.bairrosByNorm.get(c);

    if (hit) return hit;

  }



  let best: { b: Bairro; len: number } | null = null;

  for (const b of ds.bairros) {

    const nb = normalizeGeo(b.bairro_oficial);

    if (nb.length < 4) continue;



    const matchesNorm =

      norm === nb ||

      norm.startsWith(`${nb} `) ||

      norm.endsWith(` ${nb}`) ||

      norm.includes(` ${nb} `);



    const matchesWithPrefix = ["JARDIM", "VILA", "RESIDENCIAL"].some((prefix) => {

      const withPrefix = `${prefix} ${nb}`;

      return norm === withPrefix || norm.endsWith(` ${withPrefix}`) || norm.includes(` ${withPrefix}`);

    });



    if (matchesNorm || matchesWithPrefix) {

      if (!best || nb.length > best.len) best = { b, len: nb.length };

    }

  }



  return best?.b ?? null;

}



/** Mantém correção manual quando o reprocessamento não reproduziria o mesmo bairro oficial. */

export function shouldPreserveManualCorrection(existing: ResultRow, matched: ResultRow): boolean {

  if (existing.status_match !== "encontrado" || !existing.bairro_oficial) return false;

  if (matched.status_match === "encontrado" && matched.bairro_oficial === existing.bairro_oficial) {

    return false;

  }

  return true;

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



  // 1) Exata no bairro oficial

  const bairroExato = ds.bairrosByNorm.get(norm);

  if (bairroExato) {

    return fill(base, bairroExato, ds, "encontrado", 100);

  }



  // 2) Sinônimo

  const sin = ds.sinByNorm.get(norm);

  if (sin) {

    const target = ds.bairrosById.get(sin.bairro_id);

    if (target) {

      const parc = findParcelamentoForNorm(target.id, norm, ds);

      return fill(base, target, ds, "encontrado", 100, parc ?? undefined);

    }

  }



  // 3) Parcelamento exato

  const parcHit = ds.parcByNorm.get(norm);

  if (parcHit) {

    const target = ds.bairrosById.get(parcHit.bairro_id);

    if (target) {

      return fill(base, target, ds, "encontrado", 100, parcHit.parcelamento);

    }

  }



  // 4) Bairro oficial (prefixos comuns ou nome contido no informado)

  const bairroOficial = matchBairroOficial(norm, ds);

  if (bairroOficial) {

    return fill(base, bairroOficial, ds, "encontrado", 100);

  }



  // 5) Similaridade (bairros, sinônimos e parcelamentos)

  type Best = { b: Bairro; score: number; parc?: string };
  const holder: { value: Best | null } = { value: null };

  const consider = (b: Bairro, score: number, parc?: string) => {

    if (!holder.value || score > holder.value.score) holder.value = { b, score, parc };

  };



  for (const b of ds.bairros) {

    consider(b, similarity(norm, normalizeGeo(b.bairro_oficial)));

  }

  for (const [k, v] of ds.sinByNorm) {

    const target = ds.bairrosById.get(v.bairro_id);

    if (target) consider(target, similarity(norm, k));

  }

  for (const [k, v] of ds.parcByNorm) {

    const target = ds.bairrosById.get(v.bairro_id);

    if (target) consider(target, similarity(norm, k), v.parcelamento);

  }



  const finalBest = holder.value;
  if (finalBest && finalBest.score >= 85) {

    return fill(base, finalBest.b, ds, "similaridade", finalBest.score, finalBest.parc);

  }

  return { ...base, percentual_confianca: finalBest?.score ?? 0 };

}



function fill(

  base: ResultRow,

  b: Bairro,

  ds: GeoDataset,

  status: ResultRow["status_match"],

  score: number,

  parcelamentoEspecifico?: string,

): ResultRow {

  if (parcelamentoEspecifico) {

    return {

      ...base,

      bairro_oficial: b.bairro_oficial,

      regiao_urbana: b.regiao_urbana,

      parcelamento: parcelamentoEspecifico,

      status_match: status,

      percentual_confianca: score,

    };

  }

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


