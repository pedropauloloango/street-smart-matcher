import { supabase } from "@/integrations/supabase/client";
import { fetchResultados, recalcImportacaoStats } from "./api";
import { loadGeoDataset, matchOne, shouldPreserveManualCorrection } from "./match";
import type { ResultRow } from "./store";

const BATCH = 500;

export type ReprocessSummary = {
  rows: ResultRow[];
  preserved: number;
  updated: number;
};

/** Reaplica a normalização atual sobre os registros já gravados de uma importação. */
export async function reprocessImportacao(
  importacaoId: string,
  onProgress?: (pct: number) => void,
): Promise<ReprocessSummary> {
  const existing = await fetchResultados(importacaoId);
  if (!existing.length) return { rows: [], preserved: 0, updated: 0 };

  const ds = await loadGeoDataset();
  if (!ds.bairros.length) throw new Error("Cadastre bairros na Base Oficial antes de reprocessar.");

  const updated: ResultRow[] = [];
  let preserved = 0;
  let changed = 0;

  for (let i = 0; i < existing.length; i++) {
    const row = existing[i]!;
    const matched = matchOne(row.bairro_original, ds, row.linha);

    if (shouldPreserveManualCorrection(row, matched)) {
      updated.push(row);
      preserved++;
    } else {
      updated.push({ ...matched, id: row.id });
      changed++;
    }

    if (i % 200 === 0) {
      onProgress?.(Math.round((i / existing.length) * 100));
      await new Promise((r) => setTimeout(r, 0));
    }
  }
  onProgress?.(100);

  for (let i = 0; i < updated.length; i += BATCH) {
    const batch = updated.slice(i, i + BATCH).map((r) => ({
      id: r.id!,
      importacao_id: importacaoId,
      linha_original: r.linha,
      bairro_original: r.bairro_original,
      bairro_oficial: r.bairro_oficial,
      parcelamento: r.parcelamento,
      regiao_urbana: r.regiao_urbana,
      status_match: r.status_match,
      percentual_confianca: r.percentual_confianca,
    }));
    const { error } = await supabase.from("geo_resultados").upsert(batch);
    if (error) throw error;
  }

  await recalcImportacaoStats(importacaoId);
  return { rows: updated, preserved, updated: changed };
}
