import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useMemo, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { geoStore, useGeoStore, type ResultRow } from "@/lib/geo/store";
import { supabase } from "@/integrations/supabase/client";
import { normalizeGeo } from "@/lib/geo/normalize";
import { Pencil, Save, X } from "lucide-react";
import { toast } from "sonner";

export const Route = createFileRoute("/geo/resultado")({
  component: ResultadoPage,
});

type Bairro = { id: string; bairro_oficial: string; regiao_urbana: string | null };

function ResultadoPage() {
  const results = useGeoStore((s) => s.results);
  const [fStatus, setFStatus] = useState<string>("");
  const [fBairro, setFBairro] = useState("");
  const [fRegiao, setFRegiao] = useState("");
  const [editIdx, setEditIdx] = useState<number | null>(null);
  const [editBairroId, setEditBairroId] = useState<string>("");
  const [bairros, setBairros] = useState<Bairro[]>([]);

  useEffect(() => {
    (async () => {
      const sb = supabase as any;
      const { data } = await sb.from("geo_bairros").select("id,bairro_oficial,regiao_urbana").eq("ativo", true).order("bairro_oficial");
      setBairros((data ?? []) as Bairro[]);
    })();
  }, []);

  const regioes = useMemo(() => Array.from(new Set(results.map((r) => r.regiao_urbana).filter(Boolean))) as string[], [results]);

  const filtered = useMemo(() => results.filter((r) => {
    return (!fStatus || r.status_match === fStatus)
      && (!fBairro || (r.bairro_oficial ?? "").toLowerCase().includes(fBairro.toLowerCase()))
      && (!fRegiao || r.regiao_urbana === fRegiao);
  }), [results, fStatus, fBairro, fRegiao]);

  const stats = useMemo(() => {
    const enc = results.filter((r) => r.status_match === "encontrado").length;
    const sim = results.filter((r) => r.status_match === "similaridade").length;
    const nao = results.length - enc - sim;
    return { total: results.length, enc, sim, nao };
  }, [results]);

  const startEdit = (idx: number, current: ResultRow) => {
    const match = bairros.find((b) => b.bairro_oficial === current.bairro_oficial);
    setEditIdx(idx); setEditBairroId(match?.id ?? "");
  };

  const saveCorrection = async (idx: number) => {
    const target = bairros.find((b) => b.id === editBairroId);
    if (!target) return;
    const row = filtered[idx];
    const updated: ResultRow = {
      ...row,
      bairro_oficial: target.bairro_oficial,
      regiao_urbana: target.regiao_urbana,
      status_match: "encontrado",
      percentual_confianca: 100,
    };
    const fullIdx = results.indexOf(row);
    const next = results.slice();
    if (fullIdx >= 0) next[fullIdx] = updated;
    geoStore.set({ results: next });
    setEditIdx(null);

    if (confirm(`Deseja salvar "${row.bairro_original}" como sinônimo de "${target.bairro_oficial}"?`)) {
      const sb = supabase as any;
      const { error } = await sb.from("geo_sinonimos").upsert({
        bairro_id: target.id,
        nome_informado: row.bairro_original,
        nome_normalizado: normalizeGeo(row.bairro_original),
        tipo_correspondencia: "manual",
        confianca: 100,
      }, { onConflict: "nome_normalizado" });
      if (error) toast.error(error.message); else toast.success("Sinônimo cadastrado");
    }
  };

  if (!results.length) {
    return (
      <Card><CardContent className="p-8 text-center text-sm text-muted-foreground">
        Nenhum resultado. Execute uma normalização primeiro.
      </CardContent></Card>
    );
  }

  return (
    <div className="space-y-6">
      <div className="flex flex-wrap items-end justify-between gap-4">
        <div>
          <h1 className="text-2xl font-semibold">Resultado</h1>
          <p className="text-sm text-muted-foreground">{stats.total} registros · {stats.enc} encontrados · {stats.sim} por similaridade · {stats.nao} não encontrados</p>
        </div>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>Filtros</CardTitle>
          <div className="mt-2 grid grid-cols-1 gap-2 md:grid-cols-3">
            <select className="h-9 rounded-md border border-input bg-background px-3 text-sm" value={fStatus} onChange={(e) => setFStatus(e.target.value)}>
              <option value="">Todos os status</option>
              <option value="encontrado">Encontrado</option>
              <option value="similaridade">Por similaridade</option>
              <option value="nao_encontrado">Não encontrado</option>
            </select>
            <Input placeholder="Bairro oficial" value={fBairro} onChange={(e) => setFBairro(e.target.value)} />
            <select className="h-9 rounded-md border border-input bg-background px-3 text-sm" value={fRegiao} onChange={(e) => setFRegiao(e.target.value)}>
              <option value="">Todas as regiões</option>
              {regioes.map((r) => <option key={r} value={r}>{r}</option>)}
            </select>
          </div>
        </CardHeader>
        <CardContent>
          <div className="overflow-x-auto">
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Linha</TableHead>
                  <TableHead>Bairro Informado</TableHead>
                  <TableHead>Bairro Oficial</TableHead>
                  <TableHead>Parcelamento</TableHead>
                  <TableHead>Região Urbana</TableHead>
                  <TableHead>Confiança</TableHead>
                  <TableHead>Status</TableHead>
                  <TableHead className="w-28 text-right">Ações</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {filtered.slice(0, 500).map((r, i) => (
                  <TableRow key={r.linha}>
                    <TableCell>{r.linha}</TableCell>
                    <TableCell>{r.bairro_original}</TableCell>
                    <TableCell>
                      {editIdx === i ? (
                        <select className="h-8 rounded-md border border-input bg-background px-2 text-sm" value={editBairroId} onChange={(e) => setEditBairroId(e.target.value)}>
                          <option value="">— selecione —</option>
                          {bairros.map((b) => <option key={b.id} value={b.id}>{b.bairro_oficial}</option>)}
                        </select>
                      ) : (r.bairro_oficial ?? "—")}
                    </TableCell>
                    <TableCell className="max-w-[220px] truncate" title={r.parcelamento ?? ""}>{r.parcelamento ?? "—"}</TableCell>
                    <TableCell>{r.regiao_urbana ?? "—"}</TableCell>
                    <TableCell>{r.percentual_confianca}%</TableCell>
                    <TableCell>
                      {r.status_match === "encontrado" && <Badge className="bg-emerald-600">Encontrado</Badge>}
                      {r.status_match === "similaridade" && <Badge className="bg-amber-500">Similaridade</Badge>}
                      {r.status_match === "nao_encontrado" && <Badge variant="destructive">Não encontrado</Badge>}
                    </TableCell>
                    <TableCell className="text-right space-x-1">
                      {editIdx === i ? (
                        <>
                          <Button size="sm" onClick={() => saveCorrection(i)} disabled={!editBairroId}><Save className="h-3 w-3" /></Button>
                          <Button size="sm" variant="ghost" onClick={() => setEditIdx(null)}><X className="h-3 w-3" /></Button>
                        </>
                      ) : (
                        <Button size="sm" variant="ghost" onClick={() => startEdit(i, r)}><Pencil className="h-3 w-3" /></Button>
                      )}
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
            {filtered.length > 500 && (
              <p className="mt-3 text-center text-xs text-muted-foreground">Exibindo 500 de {filtered.length} registros — exporte para ver todos.</p>
            )}
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
