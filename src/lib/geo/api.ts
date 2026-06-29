// GeoBairros CG — acesso ao banco (isolado do módulo principal)
import { supabase } from "@/integrations/supabase/client";
import type { ResultRow } from "./store";

/** PostgREST/Supabase retorna no máximo 1000 linhas por request — buscar em páginas. */
const PAGE_SIZE = 1000;

type PageResult<T> = { data: T[] | null; error: { message: string } | null };

export async function fetchAllRows<T>(
  fetchPage: (from: number, to: number) => PromiseLike<PageResult<T>>,
): Promise<T[]> {
  const all: T[] = [];
  let offset = 0;
  for (;;) {
    const { data, error } = await fetchPage(offset, offset + PAGE_SIZE - 1);
    if (error) throw error;
    const page = data ?? [];
    all.push(...page);
    if (page.length < PAGE_SIZE) break;
    offset += PAGE_SIZE;
  }
  return all;
}

export type Importacao = {
  id: string;
  nome_arquivo: string;
  data_importacao: string;
  total_registros: number;
  encontrados: number;
  similares: number;
  nao_encontrados: number;
  status: string;
};

type DbResultado = {
  id: string;
  linha_original: number;
  bairro_original: string | null;
  logradouro: string | null;
  cep: string | null;
  bairro_oficial: string | null;
  parcelamento: string | null;
  regiao_urbana: string | null;
  status_match: string;
  percentual_confianca: number;
};

export function dbToResultRow(r: DbResultado): ResultRow {
  return {
    id: r.id,
    linha: r.linha_original,
    bairro_original: r.bairro_original ?? "",
    logradouro: r.logradouro,
    cep: r.cep,
    bairro_oficial: r.bairro_oficial,
    parcelamento: r.parcelamento,
    regiao_urbana: r.regiao_urbana,
    status_match: r.status_match as ResultRow["status_match"],
    percentual_confianca: Number(r.percentual_confianca),
  };
}

export function statusLabel(status: ResultRow["status_match"]): string {
  switch (status) {
    case "encontrado":
      return "Encontrado";
    case "similaridade":
      return "Encontrado por Similaridade";
    case "nao_encontrado":
      return "Não Encontrado";
  }
}

export async function fetchImportacoes(): Promise<Importacao[]> {
  const { data, error } = await supabase
    .from("geo_importacoes")
    .select("*")
    .order("data_importacao", { ascending: false });
  if (error) throw error;
  return (data ?? []) as Importacao[];
}

export async function fetchLatestImportacao(): Promise<Importacao | null> {
  const list = await fetchImportacoes();
  return list[0] ?? null;
}

export async function fetchResultados(importacaoId: string): Promise<ResultRow[]> {
  const rows = await fetchAllRows<DbResultado>((from, to) =>
    supabase
      .from("geo_resultados")
      .select("*")
      .eq("importacao_id", importacaoId)
      .order("linha_original")
      .range(from, to),
  );
  return rows.map(dbToResultRow);
}

type ResultadoPatch = Partial<
  Pick<ResultRow, "bairro_oficial" | "parcelamento" | "regiao_urbana" | "status_match" | "percentual_confianca">
>;

function resultadoPatchToDb(patch: ResultadoPatch) {
  return {
    bairro_oficial: patch.bairro_oficial,
    parcelamento: patch.parcelamento,
    regiao_urbana: patch.regiao_urbana,
    status_match: patch.status_match,
    percentual_confianca: patch.percentual_confianca,
  };
}

export async function updateResultado(id: string, patch: ResultadoPatch) {
  const { error } = await supabase.from("geo_resultados").update(resultadoPatchToDb(patch)).eq("id", id);
  if (error) throw error;
}

export async function updateResultadosBulk(ids: string[], patch: ResultadoPatch) {
  if (!ids.length) return;
  const CHUNK = 80;
  const payload = resultadoPatchToDb(patch);
  for (let i = 0; i < ids.length; i += CHUNK) {
    const chunk = ids.slice(i, i + CHUNK);
    const { error } = await supabase.from("geo_resultados").update(payload).in("id", chunk);
    if (error) throw error;
  }
}

export async function recalcImportacaoStats(importacaoId: string) {
  const rows = await fetchAllRows<{ status_match: string }>((from, to) =>
    supabase.from("geo_resultados").select("status_match").eq("importacao_id", importacaoId).range(from, to),
  );
  const enc = rows.filter((r) => r.status_match === "encontrado").length;
  const sim = rows.filter((r) => r.status_match === "similaridade").length;
  const nao = rows.length - enc - sim;
  await supabase
    .from("geo_importacoes")
    .update({ encontrados: enc, similares: sim, nao_encontrados: nao, total_registros: rows.length })
    .eq("id", importacaoId);
}

export async function fetchParcelamentosLabel(bairroId: string): Promise<string | null> {
  const { data } = await supabase
    .from("geo_parcelamentos")
    .select("parcelamento")
    .eq("bairro_id", bairroId)
    .eq("ativo", true)
    .order("parcelamento");
  const list = (data ?? []).map((p) => p.parcelamento);
  return list.length ? list.join(", ") : null;
}

export async function fetchResultadosStats(importacaoId?: string | null) {
  const rows = await fetchAllRows<{ bairro_oficial: string | null; status_match: string }>((from, to) => {
    let q = supabase.from("geo_resultados").select("bairro_oficial,status_match");
    if (importacaoId) q = q.eq("importacao_id", importacaoId);
    return q.range(from, to);
  });
  const counts = { encontrados: 0, similares: 0, naoEncontrados: 0 };
  const top: Record<string, number> = {};
  for (const r of rows) {
    if (r.status_match === "encontrado") counts.encontrados++;
    else if (r.status_match === "similaridade") counts.similares++;
    else counts.naoEncontrados++;
    if (r.bairro_oficial) top[r.bairro_oficial] = (top[r.bairro_oficial] ?? 0) + 1;
  }
  const topBairros = Object.entries(top)
    .sort((a, b) => b[1] - a[1])
    .slice(0, 5)
    .map(([bairro, total]) => ({ bairro, total }));
  return { ...counts, topBairros, total: rows.length };
}
