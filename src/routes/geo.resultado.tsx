import { createFileRoute } from "@tanstack/react-router";
import { useCallback, useDeferredValue, useEffect, useMemo, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogFooter,
  DialogHeader,
  DialogTitle,
} from "@/components/ui/dialog";
import { GeoImportSelector } from "@/components/geo/GeoImportSelector";
import {
  GeoResultadoTable,
  TABLE_PAGE_SIZE,
  buildInformadoCountMap,
  buildResultIndex,
  filterResultIndex,
  rowKey,
} from "@/components/geo/GeoResultadoTable";
import { geoStore, useGeoStore, type ResultRow } from "@/lib/geo/store";
import {
  fetchParcelamentosLabel,
  fetchResultados,
  recalcImportacaoStats,
  updateResultado,
  updateResultadosBulk,
} from "@/lib/geo/api";
import { reprocessImportacao } from "@/lib/geo/reprocess";
import { supabase } from "@/integrations/supabase/client";
import { normalizeGeo } from "@/lib/geo/normalize";
import { Pencil, RefreshCw, Save, X } from "lucide-react";
import { toast } from "sonner";

export const Route = createFileRoute("/geo/resultado")({
  component: ResultadoPage,
});

type Bairro = { id: string; bairro_oficial: string; regiao_urbana: string | null };

function ResultadoPage() {
  const importacaoId = useGeoStore((s) => s.importacaoId);
  const results = useGeoStore((s) => s.results);
  const [fStatus, setFStatus] = useState("");
  const [fBairroInformadoInput, setFBairroInformadoInput] = useState("");
  const [fBairroInput, setFBairroInput] = useState("");
  const deferredInformado = useDeferredValue(fBairroInformadoInput);
  const deferredBairro = useDeferredValue(fBairroInput);
  const isFilterPending =
    fBairroInformadoInput !== deferredInformado || fBairroInput !== deferredBairro;
  const [fRegiao, setFRegiao] = useState("");
  const [visibleCount, setVisibleCount] = useState(TABLE_PAGE_SIZE);
  const [editId, setEditId] = useState<string | null>(null);
  const [editBairroId, setEditBairroId] = useState("");
  const [selected, setSelected] = useState<Set<string>>(new Set());
  const [bulkModalOpen, setBulkModalOpen] = useState(false);
  const [bulkModalRows, setBulkModalRows] = useState<ResultRow[]>([]);
  const [bulkBairroId, setBulkBairroId] = useState("");
  const [bulkBairroSearch, setBulkBairroSearch] = useState("");
  const [bairros, setBairros] = useState<Bairro[]>([]);
  const [loading, setLoading] = useState(false);
  const [reprocessing, setReprocessing] = useState(false);
  const [reprocessPct, setReprocessPct] = useState(0);
  const [savingBulk, setSavingBulk] = useState(false);

  const loadResults = useCallback(async (impId: string | null) => {
    if (!impId) {
      geoStore.set({ results: [] });
      return;
    }
    setLoading(true);
    try {
      const rows = await fetchResultados(impId);
      geoStore.set({ results: rows });
      setSelected(new Set());
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : "Falha ao carregar resultados");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    (async () => {
      const { data } = await supabase
        .from("geo_bairros")
        .select("id,bairro_oficial,regiao_urbana")
        .eq("ativo", true)
        .order("bairro_oficial");
      setBairros((data ?? []) as Bairro[]);
    })();
  }, []);

  useEffect(() => {
    if (importacaoId) loadResults(importacaoId);
  }, [importacaoId, loadResults]);

  const regioes = useMemo(
    () => Array.from(new Set(results.map((r) => r.regiao_urbana).filter(Boolean))) as string[],
    [results],
  );

  const resultIndex = useMemo(() => buildResultIndex(results), [results]);
  const informadoCountMap = useMemo(() => buildInformadoCountMap(results), [results]);

  const filtered = useMemo(
    () =>
      filterResultIndex(resultIndex, {
        status: fStatus,
        informado: deferredInformado,
        oficial: deferredBairro,
        regiao: fRegiao,
      }),
    [resultIndex, fStatus, deferredInformado, deferredBairro, fRegiao],
  );

  useEffect(() => {
    setVisibleCount(TABLE_PAGE_SIZE);
  }, [fStatus, deferredInformado, deferredBairro, fRegiao]);

  const visibleRows = useMemo(() => filtered.slice(0, visibleCount), [filtered, visibleCount]);

  const clearBairroInformado = useCallback(() => setFBairroInformadoInput(""), []);

  const filteredKeys = useMemo(() => filtered.map(rowKey), [filtered]);
  const allFilteredSelected = filteredKeys.length > 0 && filteredKeys.every((k) => selected.has(k));
  const someFilteredSelected = filteredKeys.some((k) => selected.has(k));

  const stats = useMemo(() => {
    const enc = results.filter((r) => r.status_match === "encontrado").length;
    const sim = results.filter((r) => r.status_match === "similaridade").length;
    const nao = results.length - enc - sim;
    const conciliados = enc + sim;
    const sucesso = results.length ? Math.round((conciliados / results.length) * 100) : 0;
    return { total: results.length, enc, sim, nao, conciliados, sucesso };
  }, [results]);

  const toggleSelect = useCallback((key: string, checked: boolean) => {
    setSelected((prev) => {
      const next = new Set(prev);
      if (checked) next.add(key);
      else next.delete(key);
      return next;
    });
  }, []);

  const openBulkModal = useCallback((rows: ResultRow[]) => {
    if (!rows.length) return;
    setBulkModalRows(rows);
    setBulkBairroId("");
    setBulkBairroSearch("");
    setBulkModalOpen(true);
  }, []);

  const toggleSelectAllFiltered = useCallback(
    (checked: boolean) => {
      if (checked) {
        setSelected(new Set(filteredKeys));
        openBulkModal(filtered);
      } else {
        setSelected(new Set());
        setBulkModalOpen(false);
      }
    },
    [filtered, filteredKeys, openBulkModal],
  );

  const selectSameBairroInformado = useCallback(
    (bairroInformado: string) => {
      const rows = results.filter((r) => r.bairro_original === bairroInformado);
      setSelected(new Set(rows.map(rowKey)));
      openBulkModal(rows);
    },
    [results, openBulkModal],
  );

  const applyCorrection = async (
    rows: ResultRow[],
    target: Bairro,
    options?: { offerSynonyms?: boolean },
  ) => {
    const parcelamento = await fetchParcelamentosLabel(target.id);
    const patch: Partial<ResultRow> = {
      bairro_oficial: target.bairro_oficial,
      regiao_urbana: target.regiao_urbana,
      parcelamento,
      status_match: "encontrado",
      percentual_confianca: 100,
    };

    const withId = rows.filter((r) => r.id);
    const ids = withId.map((r) => r.id!);

    if (ids.length) {
      if (ids.length === 1) await updateResultado(ids[0]!, patch);
      else await updateResultadosBulk(ids, patch);
      if (importacaoId) await recalcImportacaoStats(importacaoId);
    }

    const keySet = new Set(rows.map(rowKey));
    const next = results.map((r) => (keySet.has(rowKey(r)) ? { ...r, ...patch } : r));
    geoStore.set({ results: next });

    if (options?.offerSynonyms !== false) {
      const grafias = [...new Set(rows.map((r) => r.bairro_original).filter(Boolean))];
      if (
        grafias.length &&
        confirm(
          `Deseja salvar ${grafias.length} grafia(s) como sinônimo(s) de "${target.bairro_oficial}"?\n\n${grafias.slice(0, 8).join("\n")}${grafias.length > 8 ? `\n… e mais ${grafias.length - 8}` : ""}`,
        )
      ) {
        const { error } = await supabase.from("geo_sinonimos").upsert(
          grafias.map((nome) => ({
            bairro_id: target.id,
            nome_informado: nome,
            nome_normalizado: normalizeGeo(nome),
            tipo_correspondencia: "manual",
            confianca: 100,
          })),
          { onConflict: "nome_normalizado" },
        );
        if (error) toast.error(error.message);
        else toast.success(`${grafias.length} sinônimo(s) cadastrado(s)`);
      }
    }
  };

  const startEdit = useCallback(
    (row: ResultRow) => {
      const match = bairros.find((b) => b.bairro_oficial === row.bairro_oficial);
      setEditId(rowKey(row));
      setEditBairroId(match?.id ?? "");
      setSelected(new Set());
    },
    [bairros],
  );

  const cancelEdit = useCallback(() => setEditId(null), []);

  const saveCorrection = async (row: ResultRow) => {
    const target = bairros.find((b) => b.id === editBairroId);
    if (!target) return;
    try {
      await applyCorrection([row], target);
      setEditId(null);
      toast.success("Correção salva");
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : "Falha ao salvar correção");
    }
  };

  const saveBulkCorrection = async () => {
    const target = bairros.find((b) => b.id === bulkBairroId);
    if (!target || !bulkModalRows.length) return;

    const count = bulkModalRows.length;
    setSavingBulk(true);
    try {
      await applyCorrection(bulkModalRows, target);
      setBulkModalOpen(false);
      setBulkModalRows([]);
      setBulkBairroId("");
      setSelected(new Set());
      toast.success(`Correção aplicada a ${count} registro(s)`);
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : "Falha ao salvar correções");
    } finally {
      setSavingBulk(false);
    }
  };

  const bairrosFiltradosModal = useMemo(() => {
    const q = bulkBairroSearch.trim().toLowerCase();
    if (!q) return bairros;
    return bairros.filter(
      (b) =>
        b.bairro_oficial.toLowerCase().includes(q) ||
        (b.regiao_urbana ?? "").toLowerCase().includes(q),
    );
  }, [bairros, bulkBairroSearch]);

  const bulkModalInformados = useMemo(
    () => [...new Set(bulkModalRows.map((r) => r.bairro_original))],
    [bulkModalRows],
  );

  const handleReprocess = async () => {
    if (!importacaoId || !results.length) return;
    if (
      !confirm(
        `Reprocessar ${results.length} registros com a base oficial e regras atuais?\n\nRegistros não conciliados e por similaridade serão reavaliados.\nCorreções manuais já salvas (conciliados) serão mantidas.`,
      )
    ) {
      return;
    }
    setReprocessing(true);
    setReprocessPct(0);
    setEditId(null);
    setSelected(new Set());
    try {
      const { rows, preserved, updated: updatedCount } = await reprocessImportacao(importacaoId, setReprocessPct);
      geoStore.set({ results: rows });
      const enc = rows.filter((r) => r.status_match === "encontrado").length;
      const sim = rows.filter((r) => r.status_match === "similaridade").length;
      toast.success(
        `Reprocessamento concluído: ${enc + sim} de ${rows.length} conciliados (${Math.round(((enc + sim) / rows.length) * 100)}%). ${updatedCount} atualizado(s), ${preserved} preservado(s).`,
      );
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : "Falha ao reprocessar");
    } finally {
      setReprocessing(false);
      setReprocessPct(0);
    }
  };

  const selectedRows = useMemo(() => results.filter((r) => selected.has(rowKey(r))), [results, selected]);
  const uniqueInformadosSelected = useMemo(
    () => [...new Set(selectedRows.map((r) => r.bairro_original))],
    [selectedRows],
  );

  const loadMoreRows = useCallback(() => {
    setVisibleCount((n) => Math.min(n + TABLE_PAGE_SIZE, filtered.length));
  }, [filtered.length]);

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-end justify-between gap-4">
        <div>
          <h1 className="text-2xl font-semibold">Resultado</h1>
          <p className="text-sm text-muted-foreground">
            {stats.total > 0
              ? "Resumo da conciliação e detalhamento por registro."
              : "Visualize e corrija os resultados da normalização."}
          </p>
        </div>
      </div>

      <Card>
        <CardContent className="space-y-4 pt-6">
          <GeoImportSelector onSelect={(imp) => imp && loadResults(imp.id)} />
          {results.length > 0 && (
            <div className="flex flex-col gap-3 border-t border-border pt-4 sm:flex-row sm:items-center sm:justify-between">
              <div>
                <p className="text-sm font-medium">Reprocessar importação</p>
                <p className="text-xs text-muted-foreground">
                  Reaplica a normalização atual (bairro oficial, sinônimos, parcelamentos e regras de setor/romano).
                  Correções manuais já conciliadas são preservadas.
                </p>
              </div>
              <Button variant="outline" onClick={handleReprocess} disabled={reprocessing || loading || !importacaoId}>
                <RefreshCw className={"h-4 w-4 " + (reprocessing ? "animate-spin" : "")} />
                {reprocessing ? `Reprocessando ${reprocessPct}%` : "Reprocessar registros"}
              </Button>
            </div>
          )}
          {reprocessing && <Progress value={reprocessPct} />}
        </CardContent>
      </Card>

      {loading ? (
        <Card>
          <CardContent className="p-8 text-center text-sm text-muted-foreground">Carregando resultados...</CardContent>
        </Card>
      ) : !results.length ? (
        <Card>
          <CardContent className="p-8 text-center text-sm text-muted-foreground">
            Nenhum resultado. Execute uma normalização ou selecione outra importação.
          </CardContent>
        </Card>
      ) : (
        <>
          <div className="grid grid-cols-2 gap-3 md:grid-cols-3 lg:grid-cols-6">
            <MiniStat label="Total" value={stats.total} />
            <MiniStat
              label="Conciliados"
              value={stats.conciliados}
              sub={`${stats.sucesso}% do total`}
              tone="emerald"
            />
            <MiniStat
              label="Não conciliados"
              value={stats.nao}
              sub={stats.total ? `${100 - stats.sucesso}% do total` : undefined}
              tone="rose"
              active={fStatus === "nao_encontrado"}
              onClick={() => setFStatus(fStatus === "nao_encontrado" ? "" : "nao_encontrado")}
            />
            <MiniStat label="Taxa de sucesso" value={`${stats.sucesso}%`} tone="primary" accent />
            <MiniStat
              label="Encontrados"
              value={stats.enc}
              tone="emerald"
              active={fStatus === "encontrado"}
              onClick={() => setFStatus(fStatus === "encontrado" ? "" : "encontrado")}
            />
            <MiniStat
              label="Por similaridade"
              value={stats.sim}
              tone="amber"
              active={fStatus === "similaridade"}
              onClick={() => setFStatus(fStatus === "similaridade" ? "" : "similaridade")}
            />
          </div>

          {selected.size > 0 && !bulkModalOpen && (
            <Card className="border-primary/40 bg-primary/5">
              <CardContent className="flex flex-col gap-3 p-4 sm:flex-row sm:items-center sm:justify-between">
                <div className="text-sm">
                  <span className="font-medium">{selected.size} registro(s) selecionado(s)</span>
                  {uniqueInformadosSelected.length > 0 && (
                    <p className="mt-0.5 text-xs text-muted-foreground">
                      {uniqueInformadosSelected.length} bairro(s) informado(s) distinto(s):{" "}
                      {uniqueInformadosSelected.slice(0, 3).join(", ")}
                      {uniqueInformadosSelected.length > 3 ? ` +${uniqueInformadosSelected.length - 3}` : ""}
                    </p>
                  )}
                </div>
                <div className="flex flex-wrap items-center gap-2">
                  <Button
                    onClick={() => openBulkModal(results.filter((r) => selected.has(rowKey(r))))}
                  >
                    <Pencil className="h-4 w-4" />
                    Editar selecionados
                  </Button>
                  <Button variant="ghost" size="sm" onClick={() => setSelected(new Set())}>
                    Limpar seleção
                  </Button>
                </div>
              </CardContent>
            </Card>
          )}

          <Dialog
            open={bulkModalOpen}
            onOpenChange={(open) => {
              setBulkModalOpen(open);
              if (!open) {
                setBulkBairroId("");
                setBulkBairroSearch("");
              }
            }}
          >
            <DialogContent className="max-w-md">
              <DialogHeader>
                <DialogTitle>Editar bairro oficial em lote</DialogTitle>
                <DialogDescription>
                  Defina o bairro oficial para {bulkModalRows.length} registro(s) de uma vez.
                </DialogDescription>
              </DialogHeader>

              <div className="space-y-4">
                <div className="rounded-md border border-border bg-muted/40 p-3 text-sm">
                  <p className="mb-1 font-medium text-foreground">Bairros informados</p>
                  <p className="text-xs text-muted-foreground">
                    {bulkModalInformados.length} grafia(s) distinta(s)
                  </p>
                  <ul className="mt-2 max-h-28 space-y-0.5 overflow-y-auto text-xs">
                    {bulkModalInformados.slice(0, 12).map((nome) => (
                      <li key={nome} className="truncate">
                        · {nome}
                      </li>
                    ))}
                    {bulkModalInformados.length > 12 && (
                      <li className="text-muted-foreground">… e mais {bulkModalInformados.length - 12}</li>
                    )}
                  </ul>
                </div>

                <div className="space-y-2">
                  <label className="text-sm font-medium" htmlFor="bulk-bairro-search">
                    Bairro oficial
                  </label>
                  <Input
                    id="bulk-bairro-search"
                    placeholder="Buscar bairro oficial…"
                    value={bulkBairroSearch}
                    onChange={(e) => setBulkBairroSearch(e.target.value)}
                  />
                  <select
                    className="h-10 w-full rounded-md border border-input bg-background px-3 text-sm"
                    value={bulkBairroId}
                    onChange={(e) => setBulkBairroId(e.target.value)}
                  >
                    <option value="">— Selecione o bairro oficial —</option>
                    {bairrosFiltradosModal.map((b) => (
                      <option key={b.id} value={b.id}>
                        {b.bairro_oficial}
                        {b.regiao_urbana ? ` (${b.regiao_urbana})` : ""}
                      </option>
                    ))}
                  </select>
                </div>
              </div>

              <DialogFooter className="gap-2 sm:gap-0">
                <Button
                  variant="outline"
                  onClick={() => {
                    setBulkModalOpen(false);
                    setBulkBairroId("");
                  }}
                  disabled={savingBulk}
                >
                  Cancelar
                </Button>
                <Button onClick={saveBulkCorrection} disabled={!bulkBairroId || savingBulk}>
                  <Save className="h-4 w-4" />
                  {savingBulk ? "Salvando…" : `Atualizar ${bulkModalRows.length} registro(s)`}
                </Button>
              </DialogFooter>
            </DialogContent>
          </Dialog>

          <Card>
            <CardHeader>
              <CardTitle>Filtros</CardTitle>
              <div className="mt-2 grid grid-cols-1 gap-2 md:grid-cols-2 lg:grid-cols-4">
                <select
                  className="h-9 rounded-md border border-input bg-background px-3 text-sm"
                  value={fStatus}
                  onChange={(e) => setFStatus(e.target.value)}
                >
                  <option value="">Todos os status</option>
                  <option value="encontrado">Encontrado</option>
                  <option value="similaridade">Encontrado por Similaridade</option>
                  <option value="nao_encontrado">Não Encontrado</option>
                </select>
                <div className="relative">
                  <Input
                    placeholder="Bairro informado"
                    value={fBairroInformadoInput}
                    onChange={(e) => setFBairroInformadoInput(e.target.value)}
                    className={fBairroInformadoInput ? "pr-9" : undefined}
                  />
                  {fBairroInformadoInput && (
                    <button
                      type="button"
                      className="absolute right-2 top-1/2 -translate-y-1/2 rounded-sm p-0.5 text-muted-foreground hover:text-foreground"
                      onClick={clearBairroInformado}
                      aria-label="Limpar filtro de bairro informado"
                      title="Limpar filtro de bairro informado"
                    >
                      <X className="h-4 w-4" />
                    </button>
                  )}
                </div>
                <Input
                  placeholder="Bairro oficial"
                  value={fBairroInput}
                  onChange={(e) => setFBairroInput(e.target.value)}
                />
                <select
                  className="h-9 rounded-md border border-input bg-background px-3 text-sm"
                  value={fRegiao}
                  onChange={(e) => setFRegiao(e.target.value)}
                >
                  <option value="">Todas as regiões</option>
                  {regioes.map((r) => (
                    <option key={r} value={r}>
                      {r}
                    </option>
                  ))}
                </select>
              </div>
              <div className="mt-3 flex flex-wrap items-center justify-between gap-2">
                <p className="text-xs text-muted-foreground">
                  {filtered.length} de {results.length} registro(s)
                  {visibleRows.length < filtered.length && (
                    <> · exibindo {visibleRows.length}</>
                  )}
                  {isFilterPending && (
                    <span className="ml-1 text-primary">· filtrando…</span>
                  )}
                  {fBairroInformadoInput && (
                    <>
                      {" · "}
                      <button
                        type="button"
                        className="text-primary hover:underline"
                        onClick={clearBairroInformado}
                      >
                        Limpar filtro de bairro informado
                      </button>
                    </>
                  )}
                </p>
                <Button
                  variant="outline"
                  size="sm"
                  disabled={!filtered.length}
                  onClick={() => {
                    setSelected(new Set(filteredKeys));
                    openBulkModal(filtered);
                  }}
                >
                  <Pencil className="h-3.5 w-3.5" />
                  Editar todas filtradas ({filtered.length})
                </Button>
              </div>
            </CardHeader>
            <CardContent className={isFilterPending ? "opacity-80 transition-opacity" : undefined}>
              <GeoResultadoTable
                rows={visibleRows}
                totalFiltered={filtered.length}
                visibleCount={visibleCount}
                onLoadMore={loadMoreRows}
                selected={selected}
                editId={editId}
                editBairroId={editBairroId}
                bairros={bairros}
                informadoCountMap={informadoCountMap}
                allFilteredSelected={allFilteredSelected}
                someFilteredSelected={someFilteredSelected}
                onToggleSelect={toggleSelect}
                onToggleSelectAll={toggleSelectAllFiltered}
                onEditBairroIdChange={setEditBairroId}
                onSelectSameInformado={selectSameBairroInformado}
                onStartEdit={startEdit}
                onSaveCorrection={saveCorrection}
                onCancelEdit={cancelEdit}
              />
            </CardContent>
          </Card>
        </>
      )}
    </div>
  );
}

const TONE_STYLES = {
  emerald: "border-emerald-500/40 bg-emerald-500/5",
  rose: "border-rose-500/40 bg-rose-500/5",
  amber: "border-amber-500/40 bg-amber-500/5",
  primary: "border-primary/40 bg-primary/5",
  default: "",
} as const;

function MiniStat({
  label,
  value,
  sub,
  tone = "default",
  accent,
  active,
  onClick,
}: {
  label: string;
  value: number | string;
  sub?: string;
  tone?: keyof typeof TONE_STYLES;
  accent?: boolean;
  active?: boolean;
  onClick?: () => void;
}) {
  const className =
    "rounded-xl border border-border bg-card text-card-foreground shadow-sm " +
    (TONE_STYLES[tone] ?? "") +
    (active ? " ring-2 ring-primary ring-offset-2 ring-offset-background" : "") +
    (onClick ? " cursor-pointer transition-shadow hover:shadow-md w-full text-left" : "");

  const inner = (
    <>
      <p className="text-[10px] font-medium uppercase tracking-wider text-muted-foreground">{label}</p>
      <p className={"mt-1 text-2xl font-semibold tabular-nums " + (accent ? "text-primary" : "")}>{value}</p>
      {sub && <p className="mt-0.5 text-xs text-muted-foreground">{sub}</p>}
    </>
  );

  if (onClick) {
    return (
      <button type="button" className={className + " p-4"} onClick={onClick}>
        {inner}
      </button>
    );
  }

  return <div className={className + " p-4"}>{inner}</div>;
}
