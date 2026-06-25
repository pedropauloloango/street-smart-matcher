import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useMemo, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Plus, Trash2, Pencil, Save, X } from "lucide-react";
import { toast } from "sonner";

export const Route = createFileRoute("/geo/base")({
  component: BaseOficial,
});

type Bairro = { id: string; bairro_oficial: string; regiao_urbana: string | null; ativo: boolean };
type Parc = { id: string; bairro_id: string; parcelamento: string; ativo: boolean };

function BaseOficial() {
  const [bairros, setBairros] = useState<Bairro[]>([]);
  const [parc, setParc] = useState<Parc[]>([]);
  const [fBairro, setFBairro] = useState("");
  const [fRegiao, setFRegiao] = useState("");
  const [novoBairro, setNovoBairro] = useState("");
  const [novaRegiao, setNovaRegiao] = useState("");
  const [editId, setEditId] = useState<string | null>(null);
  const [editVals, setEditVals] = useState<{ bairro_oficial: string; regiao_urbana: string }>({ bairro_oficial: "", regiao_urbana: "" });
  const [openId, setOpenId] = useState<string | null>(null);
  const [novoParc, setNovoParc] = useState("");

  const load = async () => {
    const sb = supabase as any;
    const [b, p] = await Promise.all([
      sb.from("geo_bairros").select("*").order("bairro_oficial"),
      sb.from("geo_parcelamentos").select("*").order("parcelamento"),
    ]);
    setBairros((b.data ?? []) as Bairro[]);
    setParc((p.data ?? []) as Parc[]);
  };
  useEffect(() => { load(); }, []);

  const regioes = useMemo(() => Array.from(new Set(bairros.map((b) => b.regiao_urbana).filter(Boolean))) as string[], [bairros]);

  const filtered = useMemo(() => bairros.filter((b) => {
    return (!fBairro || b.bairro_oficial.toLowerCase().includes(fBairro.toLowerCase()))
      && (!fRegiao || b.regiao_urbana === fRegiao);
  }), [bairros, fBairro, fRegiao]);

  const parcByB = useMemo(() => {
    const m = new Map<string, Parc[]>();
    for (const x of parc) {
      const a = m.get(x.bairro_id) ?? [];
      a.push(x); m.set(x.bairro_id, a);
    }
    return m;
  }, [parc]);

  const addBairro = async () => {
    if (!novoBairro.trim()) return;
    const sb = supabase as any;
    const { error } = await sb.from("geo_bairros").insert({ bairro_oficial: novoBairro.trim(), regiao_urbana: novaRegiao.trim() || null });
    if (error) return toast.error(error.message);
    setNovoBairro(""); setNovaRegiao(""); toast.success("Bairro cadastrado"); load();
  };
  const delBairro = async (id: string) => {
    if (!confirm("Excluir este bairro e seus parcelamentos?")) return;
    const sb = supabase as any;
    await sb.from("geo_bairros").delete().eq("id", id); load();
  };
  const saveEdit = async (id: string) => {
    const sb = supabase as any;
    await sb.from("geo_bairros").update({ bairro_oficial: editVals.bairro_oficial, regiao_urbana: editVals.regiao_urbana || null }).eq("id", id);
    setEditId(null); load();
  };
  const addParc = async (bairro_id: string) => {
    if (!novoParc.trim()) return;
    const sb = supabase as any;
    await sb.from("geo_parcelamentos").insert({ bairro_id, parcelamento: novoParc.trim() });
    setNovoParc(""); load();
  };
  const delParc = async (id: string) => {
    const sb = supabase as any;
    await sb.from("geo_parcelamentos").delete().eq("id", id); load();
  };

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">Base Oficial</h1>
        <p className="text-sm text-muted-foreground">Cadastro de bairros oficiais, regiões urbanas e parcelamentos.</p>
      </div>

      <Card>
        <CardHeader><CardTitle>Novo bairro oficial</CardTitle></CardHeader>
        <CardContent className="flex flex-col gap-2 md:flex-row">
          <Input placeholder="Bairro oficial (ex: Amambaí)" value={novoBairro} onChange={(e) => setNovoBairro(e.target.value)} />
          <Input placeholder="Região urbana" value={novaRegiao} onChange={(e) => setNovaRegiao(e.target.value)} />
          <Button onClick={addBairro}><Plus className="h-4 w-4" /> Adicionar</Button>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Bairros cadastrados ({filtered.length})</CardTitle>
          <div className="mt-2 flex flex-col gap-2 md:flex-row">
            <Input placeholder="Filtrar por bairro" value={fBairro} onChange={(e) => setFBairro(e.target.value)} />
            <select className="h-9 rounded-md border border-input bg-background px-3 text-sm" value={fRegiao} onChange={(e) => setFRegiao(e.target.value)}>
              <option value="">Todas as regiões</option>
              {regioes.map((r) => <option key={r} value={r}>{r}</option>)}
            </select>
          </div>
        </CardHeader>
        <CardContent>
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>Bairro Oficial</TableHead>
                <TableHead>Região Urbana</TableHead>
                <TableHead className="text-center">Parcelamentos</TableHead>
                <TableHead className="w-40 text-right">Ações</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {filtered.flatMap((b) => {
                const rows = [
                  <TableRow key={b.id}>
                    {editId === b.id ? (
                      <>
                        <TableCell><Input value={editVals.bairro_oficial} onChange={(e) => setEditVals({ ...editVals, bairro_oficial: e.target.value })} /></TableCell>
                        <TableCell><Input value={editVals.regiao_urbana} onChange={(e) => setEditVals({ ...editVals, regiao_urbana: e.target.value })} /></TableCell>
                        <TableCell className="text-center">{(parcByB.get(b.id) ?? []).length}</TableCell>
                        <TableCell className="text-right space-x-1">
                          <Button size="sm" onClick={() => saveEdit(b.id)}><Save className="h-3 w-3" /></Button>
                          <Button size="sm" variant="ghost" onClick={() => setEditId(null)}><X className="h-3 w-3" /></Button>
                        </TableCell>
                      </>
                    ) : (
                      <>
                        <TableCell className="font-medium">{b.bairro_oficial}</TableCell>
                        <TableCell>{b.regiao_urbana ?? "—"}</TableCell>
                        <TableCell className="text-center">
                          <button className="text-primary hover:underline" onClick={() => setOpenId(openId === b.id ? null : b.id)}>
                            {(parcByB.get(b.id) ?? []).length}
                          </button>
                        </TableCell>
                        <TableCell className="text-right space-x-1">
                          <Button size="sm" variant="ghost" onClick={() => { setEditId(b.id); setEditVals({ bairro_oficial: b.bairro_oficial, regiao_urbana: b.regiao_urbana ?? "" }); }}><Pencil className="h-3 w-3" /></Button>
                          <Button size="sm" variant="ghost" onClick={() => delBairro(b.id)}><Trash2 className="h-3 w-3" /></Button>
                        </TableCell>
                      </>
                    )}
                  </TableRow>,
                ];
                if (openId === b.id) {
                  rows.push(
                    <TableRow key={b.id + "-p"}>
                      <TableCell colSpan={4} className="bg-muted/30">
                        <div className="space-y-2">
                          <div className="flex gap-2">
                            <Input placeholder="Novo parcelamento" value={novoParc} onChange={(e) => setNovoParc(e.target.value)} />
                            <Button size="sm" onClick={() => addParc(b.id)}><Plus className="h-3 w-3" /> Adicionar</Button>
                          </div>
                          <ul className="space-y-1">
                            {(parcByB.get(b.id) ?? []).map((p) => (
                              <li key={p.id} className="flex items-center justify-between rounded border border-border bg-background px-3 py-1.5 text-sm">
                                <span>{p.parcelamento}</span>
                                <Button size="sm" variant="ghost" onClick={() => delParc(p.id)}><Trash2 className="h-3 w-3" /></Button>
                              </li>
                            ))}
                            {(parcByB.get(b.id) ?? []).length === 0 && <li className="text-xs text-muted-foreground">Sem parcelamentos cadastrados.</li>}
                          </ul>
                        </div>
                      </TableCell>
                    </TableRow>
                  );
                }
                return rows;
              })}
              {filtered.length === 0 && (
                <TableRow><TableCell colSpan={4} className="text-center text-sm text-muted-foreground">Nenhum bairro cadastrado.</TableCell></TableRow>
              )}
            </TableBody>
          </Table>
        </CardContent>
      </Card>
    </div>
  );
}
