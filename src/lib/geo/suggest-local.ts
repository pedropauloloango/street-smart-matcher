import { normalizeGeo } from "./normalize";
import { similarity } from "./levenshtein";
import { cepBoostForBairro, normalizeCep, type BairroCep, buildCepsByBairro } from "./cep";

export type OfficialBairro = {
  id: string;
  bairro_oficial: string;
  regiao_urbana: string | null;
};

export type OfficialParcelamento = {
  id: string;
  bairro_id: string;
  parcelamento: string;
  bairro_oficial: string;
  regiao_urbana: string | null;
};

export type SuggestContext = {
  cep?: string | null;
  logradouro?: string | null;
  ceps?: BairroCep[];
  parcelamentos?: OfficialParcelamento[];
};

export type BairroSuggestion = {
  bairro_id: string;
  bairro_oficial: string;
  regiao_urbana: string | null;
  score: number;
  source: "local" | "nominatim" | "wikipedia" | "web" | "cep" | "viacep" | "parcelamento";
  hint?: string;
  parcelamento?: string;
};

const LOCAL_MIN_SCORE = 40;
const MAX_SUGGESTIONS = 5;

export function suggestionKey(informado: string, ctx?: SuggestContext): string {
  const cep = normalizeCep(ctx?.cep) ?? "";
  const log = ctx?.logradouro?.trim() ?? "";
  return `${informado}|${cep}|${log}`;
}

function tokenSet(text: string): Set<string> {
  return new Set(
    normalizeGeo(text)
      .split(/\s+/)
      .filter((t) => t.length > 2),
  );
}

function tokenOverlapScore(a: string, b: string): number {
  const ta = tokenSet(a);
  const tb = tokenSet(b);
  if (!ta.size || !tb.size) return 0;
  let shared = 0;
  for (const t of ta) if (tb.has(t)) shared++;
  return Math.round((shared / Math.max(ta.size, tb.size)) * 100);
}

/** Sugestões locais contra a base oficial (sem rede). */
export function getLocalSuggestions(
  informado: string,
  bairros: OfficialBairro[],
  ctx?: SuggestContext,
): BairroSuggestion[] {
  const norm = normalizeGeo(informado);
  if (!norm && !ctx?.cep) return [];

  const cepsByBairro = ctx?.ceps?.length ? buildCepsByBairro(ctx.ceps) : new Map<string, BairroCep[]>();
  const scored: BairroSuggestion[] = [];

  const localTexts = [informado, ctx?.logradouro ?? ""].filter(Boolean);
  if (ctx?.parcelamentos?.length) {
    scored.push(...matchParcelamentoFromTexts(localTexts, ctx.parcelamentos, "parcelamento"));
  }

  for (const b of bairros) {
    const bn = normalizeGeo(b.bairro_oficial);
    const lev = norm ? similarity(norm, bn) : 0;
    const overlap = norm ? tokenOverlapScore(informado, b.bairro_oficial) : 0;
    const contains =
      norm && (norm.includes(bn) || bn.includes(norm))
        ? 88
        : norm && (norm.startsWith(bn) || bn.startsWith(norm))
          ? 75
          : 0;
    const cepBoost = ctx?.cep ? cepBoostForBairro(b.id, ctx.cep, cepsByBairro) : 0;
    let score = Math.max(lev, overlap, contains, cepBoost);

    if (score >= LOCAL_MIN_SCORE || cepBoost >= 95) {
      scored.push({
        bairro_id: b.id,
        bairro_oficial: b.bairro_oficial,
        regiao_urbana: b.regiao_urbana,
        score,
        source: cepBoost >= 95 ? "cep" : "local",
        hint:
          cepBoost >= 95
            ? `CEP ${normalizeCep(ctx?.cep) ?? ""} na faixa do bairro`
            : score === lev
              ? "similaridade textual"
              : contains
                ? "nome contido"
                : "palavras em comum",
      });
    }
  }

  return dedupeSuggestions(scored).slice(0, MAX_SUGGESTIONS);
}

/** Cruza textos (ViaCEP, web, informado) com parcelamentos cadastrados → bairro oficial. */
export function matchParcelamentoFromTexts(
  texts: string[],
  parcelamentos: OfficialParcelamento[],
  source: BairroSuggestion["source"],
): BairroSuggestion[] {
  if (!texts.length || !parcelamentos.length) return [];

  const blob = texts.join(" ").toLowerCase();
  const blobNorm = normalizeGeo(blob);
  const scored: BairroSuggestion[] = [];

  for (const p of parcelamentos) {
    const normParc = normalizeGeo(p.parcelamento);
    if (!normParc || normParc.length < 3) continue;

    const nameLower = p.parcelamento.toLowerCase();
    const exactInBlob =
      blob.includes(nameLower) ||
      blobNorm.includes(normParc) ||
      blobNorm.split(/\s+/).some((tok) => tok === normParc);

    if (exactInBlob) {
      scored.push({
        bairro_id: p.bairro_id,
        bairro_oficial: p.bairro_oficial,
        regiao_urbana: p.regiao_urbana,
        score: 98,
        source,
        parcelamento: p.parcelamento,
        hint: `parcelamento ${p.parcelamento} → ${p.bairro_oficial}`,
      });
      continue;
    }

    for (const text of texts) {
      const tNorm = normalizeGeo(text);
      if (!tNorm) continue;
      const sim = similarity(tNorm, normParc);
      if (sim >= 88) {
        scored.push({
          bairro_id: p.bairro_id,
          bairro_oficial: p.bairro_oficial,
          regiao_urbana: p.regiao_urbana,
          score: sim,
          source,
          parcelamento: p.parcelamento,
          hint: `parcelamento ${p.parcelamento} → ${p.bairro_oficial}`,
        });
        break;
      }
    }
  }

  return dedupeSuggestions(scored);
}

function blobConflictsWithOfficial(blobNorm: string, normOfficial: string): boolean {
  const tokens = blobNorm.split(/\s+/).filter((t) => t.length >= 6);
  for (const tok of tokens) {
    if (tok === normOfficial) continue;
    const sim = similarity(tok, normOfficial);
    if (sim >= 62 && sim < 92) return true;
  }
  return false;
}

/** Cruza textos da web com nomes oficiais conhecidos. */
export function matchOfficialFromTexts(
  texts: string[],
  bairros: OfficialBairro[],
  source: BairroSuggestion["source"],
): BairroSuggestion[] {
  const blob = texts.join(" ").toLowerCase();
  const blobNorm = normalizeGeo(blob);
  const scored: BairroSuggestion[] = [];

  for (const b of bairros) {
    const name = b.bairro_oficial.toLowerCase();
    const normName = normalizeGeo(b.bairro_oficial);

    if (blob.includes(name) || (normName.length >= 4 && blobNorm.includes(normName))) {
      scored.push({
        bairro_id: b.id,
        bairro_oficial: b.bairro_oficial,
        regiao_urbana: b.regiao_urbana,
        score: 92,
        source,
        hint: "citado em resultado da busca",
      });
      continue;
    }

    if (blobConflictsWithOfficial(blobNorm, normName)) continue;

    for (const text of texts) {
      const sim = similarity(normalizeGeo(text), normName);
      if (sim >= 88) {
        scored.push({
          bairro_id: b.id,
          bairro_oficial: b.bairro_oficial,
          regiao_urbana: b.regiao_urbana,
          score: sim,
          source,
          hint: text.slice(0, 80),
        });
        break;
      }
    }
  }

  return dedupeSuggestions(scored);
}

export function mergeSuggestions(...lists: BairroSuggestion[][]): BairroSuggestion[] {
  return dedupeSuggestions(lists.flat()).slice(0, MAX_SUGGESTIONS);
}

function dedupeSuggestions(items: BairroSuggestion[]): BairroSuggestion[] {
  const byId = new Map<string, BairroSuggestion>();
  for (const item of items) {
    const prev = byId.get(item.bairro_id);
    if (!prev || item.score > prev.score) byId.set(item.bairro_id, item);
  }
  return [...byId.values()].sort((a, b) => b.score - a.score);
}

export function sleep(ms: number) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}
