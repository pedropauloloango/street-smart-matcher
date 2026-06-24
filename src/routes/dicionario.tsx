import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { toast } from "sonner";
import { Toaster } from "@/components/ui/sonner";
import { Trash2 } from "lucide-react";

export const Route = createFileRoute("/dicionario")({
  head: () => ({
    meta: [
      { title: "Dicionário · BairroMatch" },
      { name: "description", content: "Dicionário aprendido de bairros: referência SISGRAN + correções manuais." },
    ],
  }),
  component: DicionarioPage,
});

type Entry = {
  id: string;
  bairro_normalizado: string;
  bairro_oficial: string;
  parcelamento: string | null;
  regiao_urbana: string | null;
  origem: string;
  updated_at: string;
};

function DicionarioPage() {
  const [items, setItems] = useState<Entry[]>([]);
  const [loading, setLoading] = useState(true);
  const [search, setSearch] = useState("");

  const load = async () => {
    setLoading(true);
    const { data } = await supabase
      .from("bairros_dicionario")
      .select("*")
      .order("updated_at", { ascending: false })
      .limit(500);
    setItems((data ?? []) as any);
    setLoading(false);
  };

  useEffect(() => { load(); }, []);

  const handleDelete = async (id: string) => {
    if (!confirm("Remover esta entrada?")) return;
    const { error } = await supabase.from("bairros_dicionario").delete().eq("id", id);
    if (error) return toast.error(error.message);
    setItems((p) => p.filter((i) => i.id !== id));
    toast.success("Removido.");
  };

  const filtered = items.filter((i) =>
    !search ||
    i.bairro_normalizado.toLowerCase().includes(search.toLowerCase()) ||
    i.bairro_oficial.toLowerCase().includes(search.toLowerCase()),
  );

  return (
    <div className="space-y-6">
      <Toaster richColors position="top-right" />
      <div className="flex flex-wrap items-end justify-between gap-3">
        <div>
          <h1 className="text-2xl font-bold">Dicionário de bairros</h1>
          <p className="text-sm text-muted-foreground">
            {items.length} entradas · referência SISGRAN + correções manuais aprendidas.
          </p>
        </div>
        <Input
          placeholder="Buscar bairro…"
          value={search}
          onChange={(e) => setSearch(e.target.value)}
          className="w-full max-w-xs"
        />
      </div>

      <div className="overflow-x-auto rounded-xl border border-border/60 bg-surface shadow-soft">
        <table className="min-w-full text-sm">
          <thead className="bg-secondary/60 text-xs uppercase text-muted-foreground">
            <tr>
              <th className="px-3 py-2 text-left">Normalizado</th>
              <th className="px-3 py-2 text-left">Bairro Oficial</th>
              <th className="px-3 py-2 text-left">Parcelamento</th>
              <th className="px-3 py-2 text-left">Região</th>
              <th className="px-3 py-2 text-left">Origem</th>
              <th className="px-3 py-2"></th>
            </tr>
          </thead>
          <tbody className="divide-y divide-border/60">
            {loading && <tr><td colSpan={6} className="px-3 py-8 text-center text-muted-foreground">Carregando…</td></tr>}
            {!loading && filtered.length === 0 && (
              <tr><td colSpan={6} className="px-3 py-8 text-center text-muted-foreground">Nada por aqui.</td></tr>
            )}
            {filtered.map((it) => (
              <tr key={it.id}>
                <td className="px-3 py-2 font-mono text-xs">{it.bairro_normalizado}</td>
                <td className="px-3 py-2 font-medium">{it.bairro_oficial}</td>
                <td className="px-3 py-2 text-muted-foreground">{it.parcelamento ?? "—"}</td>
                <td className="px-3 py-2 text-muted-foreground">{it.regiao_urbana ?? "—"}</td>
                <td className="px-3 py-2">
                  <Badge variant={it.origem === "correcao" ? "default" : "secondary"}>{it.origem}</Badge>
                </td>
                <td className="px-3 py-2 text-right">
                  <Button size="icon" variant="ghost" onClick={() => handleDelete(it.id)}>
                    <Trash2 className="h-4 w-4 text-destructive" />
                  </Button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
