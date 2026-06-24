import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { Badge } from "@/components/ui/badge";
import { Database, TrendingUp, FileSpreadsheet } from "lucide-react";

export const Route = createFileRoute("/historico")({
  head: () => ({
    meta: [
      { title: "Histórico · BairroMatch" },
      { name: "description", content: "Histórico de processamentos de planilhas de bairros." },
    ],
  }),
  component: HistoricoPage,
});

type Processamento = {
  id: string;
  nome_arquivo: string;
  total_registros: number;
  matched: number;
  unmatched: number;
  percentual: number;
  created_at: string;
};

function HistoricoPage() {
  const [items, setItems] = useState<Processamento[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    (async () => {
      const { data } = await supabase
        .from("processamentos")
        .select("*")
        .order("created_at", { ascending: false })
        .limit(100);
      setItems((data ?? []) as any);
      setLoading(false);
    })();
  }, []);

  const totalProc = items.length;
  const totalRegs = items.reduce((s, i) => s + i.total_registros, 0);
  const avgPct = items.length ? items.reduce((s, i) => s + Number(i.percentual), 0) / items.length : 0;

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-bold">Histórico de processamentos</h1>
        <p className="text-sm text-muted-foreground">Últimos 100 processamentos executados.</p>
      </div>

      <div className="grid gap-3 sm:grid-cols-3">
        <Card icon={<FileSpreadsheet className="h-4 w-4" />} label="Processamentos" value={totalProc.toString()} />
        <Card icon={<Database className="h-4 w-4" />} label="Registros processados" value={totalRegs.toLocaleString("pt-BR")} />
        <Card icon={<TrendingUp className="h-4 w-4" />} label="Taxa média de match" value={`${avgPct.toFixed(1)}%`} />
      </div>

      <div className="overflow-x-auto rounded-xl border border-border/60 bg-surface shadow-soft">
        <table className="min-w-full text-sm">
          <thead className="bg-secondary/60 text-xs uppercase text-muted-foreground">
            <tr>
              <th className="px-3 py-2 text-left">Arquivo</th>
              <th className="px-3 py-2 text-left">Data</th>
              <th className="px-3 py-2 text-right">Total</th>
              <th className="px-3 py-2 text-right">Match</th>
              <th className="px-3 py-2 text-right">Sem match</th>
              <th className="px-3 py-2 text-right">%</th>
            </tr>
          </thead>
          <tbody className="divide-y divide-border/60">
            {loading && (
              <tr><td colSpan={6} className="px-3 py-8 text-center text-muted-foreground">Carregando…</td></tr>
            )}
            {!loading && items.length === 0 && (
              <tr><td colSpan={6} className="px-3 py-8 text-center text-muted-foreground">Nenhum processamento ainda.</td></tr>
            )}
            {items.map((it) => (
              <tr key={it.id}>
                <td className="px-3 py-2 font-medium">{it.nome_arquivo}</td>
                <td className="px-3 py-2 text-muted-foreground">{new Date(it.created_at).toLocaleString("pt-BR")}</td>
                <td className="px-3 py-2 text-right">{it.total_registros.toLocaleString("pt-BR")}</td>
                <td className="px-3 py-2 text-right text-success">{it.matched.toLocaleString("pt-BR")}</td>
                <td className="px-3 py-2 text-right text-warning">{it.unmatched.toLocaleString("pt-BR")}</td>
                <td className="px-3 py-2 text-right">
                  <Badge variant="secondary">{Number(it.percentual).toFixed(1)}%</Badge>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}

function Card({ icon, label, value }: { icon: React.ReactNode; label: string; value: string }) {
  return (
    <div className="rounded-xl border border-border/60 bg-surface p-4 shadow-soft">
      <div className="flex items-center justify-between text-muted-foreground">
        <span className="text-xs font-medium uppercase tracking-wide">{label}</span>
        {icon}
      </div>
      <p className="mt-1 text-2xl font-bold">{value}</p>
    </div>
  );
}
