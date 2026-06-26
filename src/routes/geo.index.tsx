import { createFileRoute } from "@tanstack/react-router";
import { useCallback, useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { fetchImportacoes, fetchResultadosStats, type Importacao } from "@/lib/geo/api";

export const Route = createFileRoute("/geo/")({
  component: Dashboard,
});

type Stats = {
  bairros: number;
  parcelamentos: number;
  sinonimos: number;
  importacoes: number;
  encontrados: number;
  similares: number;
  naoEncontrados: number;
  topBairros: { bairro: string; total: number }[];
  resultTotal: number;
};

function Dashboard() {
  const [s, setS] = useState<Stats | null>(null);
  const [filterImp, setFilterImp] = useState<string | null>(null);
  const [importList, setImportList] = useState<Importacao[]>([]);

  const load = useCallback(async (importacaoId: string | null) => {
    const [b, p, si, imp, resStats] = await Promise.all([
      supabase.from("geo_bairros").select("id", { count: "exact", head: true }).eq("ativo", true),
      supabase.from("geo_parcelamentos").select("id", { count: "exact", head: true }).eq("ativo", true),
      supabase.from("geo_sinonimos").select("id", { count: "exact", head: true }),
      supabase.from("geo_importacoes").select("id", { count: "exact", head: true }),
      fetchResultadosStats(importacaoId),
    ]);
    setS({
      bairros: b.count ?? 0,
      parcelamentos: p.count ?? 0,
      sinonimos: si.count ?? 0,
      importacoes: imp.count ?? 0,
      encontrados: resStats.encontrados,
      similares: resStats.similares,
      naoEncontrados: resStats.naoEncontrados,
      topBairros: resStats.topBairros,
      resultTotal: resStats.total,
    });
  }, []);

  useEffect(() => {
    fetchImportacoes().then(setImportList);
    load(null);
  }, [load]);

  const total = s ? s.encontrados + s.similares + s.naoEncontrados : 0;
  const sucesso = total ? Math.round(((s!.encontrados + s!.similares) / total) * 100) : 0;
  const maxTop = s?.topBairros[0]?.total ?? 1;

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">GeoBairros CG</h1>
        <p className="text-sm text-muted-foreground">Normalização e relacionamento de bairros de Campo Grande-MS.</p>
      </div>

      <div className="grid grid-cols-2 gap-4 md:grid-cols-5">
        <Stat label="Bairros oficiais" value={s?.bairros ?? "—"} />
        <Stat label="Parcelamentos" value={s?.parcelamentos ?? "—"} />
        <Stat label="Sinônimos" value={s?.sinonimos ?? "—"} />
        <Stat label="Importações" value={s?.importacoes ?? "—"} />
        <Stat label="Sucesso normalização" value={filterImp ? `${sucesso}%` : total ? `${sucesso}%` : "—"} accent />
      </div>

      <Card>
        <CardHeader>
          <CardTitle className="text-base">Filtrar gráficos por importação</CardTitle>
        </CardHeader>
        <CardContent className="space-y-3">
          <select
            className="h-9 w-full max-w-md rounded-md border border-input bg-background px-3 text-sm"
            value={filterImp ?? ""}
            onChange={(e) => {
              const id = e.target.value || null;
              setFilterImp(id);
              load(id);
            }}
          >
            <option value="">Todas as importações (acumulado)</option>
            {importList.map((imp) => (
              <option key={imp.id} value={imp.id}>
                {imp.nome_arquivo} — {new Date(imp.data_importacao).toLocaleString("pt-BR")}
              </option>
            ))}
          </select>
          {filterImp && (
            <p className="text-xs text-muted-foreground">
              Exibindo estatísticas da importação selecionada ({s?.resultTotal ?? 0} registros).
            </p>
          )}
        </CardContent>
      </Card>

      <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
        <Card>
          <CardHeader>
            <CardTitle>Registros encontrados</CardTitle>
          </CardHeader>
          <CardContent>
            <Bar label="Encontrados" value={s?.encontrados ?? 0} total={total} color="bg-emerald-500" />
            <Bar label="Encontrado por Similaridade" value={s?.similares ?? 0} total={total} color="bg-amber-500" />
            <Bar label="Não encontrados" value={s?.naoEncontrados ?? 0} total={total} color="bg-rose-500" />
          </CardContent>
        </Card>
        <Card>
          <CardHeader>
            <CardTitle>Top bairros mais consultados</CardTitle>
          </CardHeader>
          <CardContent className="space-y-2">
            {s?.topBairros.length ? (
              s.topBairros.map((t) => (
                <div key={t.bairro}>
                  <div className="flex justify-between text-sm">
                    <span>{t.bairro}</span>
                    <span className="text-muted-foreground">{t.total}</span>
                  </div>
                  <div className="h-2 w-full rounded bg-secondary">
                    <div className="h-full rounded bg-primary" style={{ width: `${(t.total / maxTop) * 100}%` }} />
                  </div>
                </div>
              ))
            ) : (
              <p className="text-sm text-muted-foreground">Sem dados ainda.</p>
            )}
          </CardContent>
        </Card>
      </div>
    </div>
  );
}

function Stat({ label, value, accent }: { label: string; value: number | string; accent?: boolean }) {
  return (
    <Card>
      <CardContent className="p-4">
        <p className="text-xs uppercase tracking-wider text-muted-foreground">{label}</p>
        <p className={"mt-1 text-2xl font-semibold " + (accent ? "text-primary" : "")}>{value}</p>
      </CardContent>
    </Card>
  );
}

function Bar({ label, value, total, color }: { label: string; value: number; total: number; color: string }) {
  const pct = total ? (value / total) * 100 : 0;
  return (
    <div className="mb-3">
      <div className="flex justify-between text-sm">
        <span>{label}</span>
        <span className="text-muted-foreground">{value}</span>
      </div>
      <div className="h-2 w-full rounded bg-secondary">
        <div className={"h-full rounded " + color} style={{ width: `${pct}%` }} />
      </div>
    </div>
  );
}
