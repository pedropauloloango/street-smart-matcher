import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";

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
};

function Dashboard() {
  const [s, setS] = useState<Stats | null>(null);

  useEffect(() => {
    (async () => {
      const sb = supabase as any;
      const [b, p, si, imp, res] = await Promise.all([
        sb.from("geo_bairros").select("id", { count: "exact", head: true }),
        sb.from("geo_parcelamentos").select("id", { count: "exact", head: true }),
        sb.from("geo_sinonimos").select("id", { count: "exact", head: true }),
        sb.from("geo_importacoes").select("id", { count: "exact", head: true }),
        sb.from("geo_resultados").select("bairro_oficial,status_match"),
      ]);
      const rows = (res.data ?? []) as { bairro_oficial: string | null; status_match: string }[];
      const counts = { encontrados: 0, similares: 0, naoEncontrados: 0 };
      const top: Record<string, number> = {};
      for (const r of rows) {
        if (r.status_match === "encontrado") counts.encontrados++;
        else if (r.status_match === "similaridade") counts.similares++;
        else counts.naoEncontrados++;
        if (r.bairro_oficial) top[r.bairro_oficial] = (top[r.bairro_oficial] ?? 0) + 1;
      }
      const topBairros = Object.entries(top).sort((a, b) => b[1] - a[1]).slice(0, 5).map(([bairro, total]) => ({ bairro, total }));
      setS({
        bairros: b.count ?? 0,
        parcelamentos: p.count ?? 0,
        sinonimos: si.count ?? 0,
        importacoes: imp.count ?? 0,
        ...counts,
        topBairros,
      });
    })();
  }, []);

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
        <Stat label="Sucesso normalização" value={`${sucesso}%`} accent />
      </div>

      <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
        <Card>
          <CardHeader><CardTitle>Status de registros</CardTitle></CardHeader>
          <CardContent>
            <Bar label="Encontrados" value={s?.encontrados ?? 0} total={total} color="bg-emerald-500" />
            <Bar label="Por similaridade" value={s?.similares ?? 0} total={total} color="bg-amber-500" />
            <Bar label="Não encontrados" value={s?.naoEncontrados ?? 0} total={total} color="bg-rose-500" />
          </CardContent>
        </Card>
        <Card>
          <CardHeader><CardTitle>Top bairros consultados</CardTitle></CardHeader>
          <CardContent className="space-y-2">
            {s?.topBairros.length ? s.topBairros.map((t) => (
              <div key={t.bairro}>
                <div className="flex justify-between text-sm"><span>{t.bairro}</span><span className="text-muted-foreground">{t.total}</span></div>
                <div className="h-2 w-full rounded bg-secondary"><div className="h-full rounded bg-primary" style={{ width: `${(t.total / maxTop) * 100}%` }} /></div>
              </div>
            )) : <p className="text-sm text-muted-foreground">Sem dados ainda.</p>}
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
      <div className="flex justify-between text-sm"><span>{label}</span><span className="text-muted-foreground">{value}</span></div>
      <div className="h-2 w-full rounded bg-secondary"><div className={"h-full rounded " + color} style={{ width: `${pct}%` }} /></div>
    </div>
  );
}
