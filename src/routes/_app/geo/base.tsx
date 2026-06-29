import { createFileRoute } from "@tanstack/react-router";
import { useEffect, useMemo, useState } from "react";
import { supabase } from "@/integrations/supabase/client";
import { fetchAllRows } from "@/lib/geo/api";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Plus, Trash2, Pencil, Save, X, ChevronDown, ChevronUp } from "lucide-react";
import { normalizeGeo } from "@/lib/geo/normalize";
import { formatCep, normalizeCep } from "@/lib/geo/cep";
import { toast } from "sonner";

export const Route = createFileRoute("/_app/geo/base")({
  component: BaseOficial,
});

type Bairro = { id: string; bairro_oficial: string; regiao_urbana: string | null; ativo: boolean };
type Parc = { id: string; bairro_id: string; parcelamento: string; ativo: boolean };
type BairroCepRow = {
  id: string;
  bairro_id: string;
  cep_inicio: string;
  cep_fim: string | null;
  logradouro: string | null;
  ativo: boolean;
};
type Sinonimo = {
  id: string;
  bairro_id: string;
  nome_informado: string;
  nome_normalizado: string;
  tipo_correspondencia: string;
  confianca: number;
};

function BaseOficial() {
  const [bairros, setBairros] = useState<Bairro[]>([]);
  const [parc, setParc] = useState<Parc[]>([]);
  const [ceps, setCeps] = useState<BairroCepRow[]>([]);
  const [sinonimos, setSinonimos] = useState<Sinonimo[]>([]);
  const [fBairro, setFBairro] = useState("");
  const [fRegiao, setFRegiao] = useState("");
  const [fParc, setFParc] = useState("");
  const [fSemParc, setFSemParc] = useState(false);
  const [fSin, setFSin] = useState("");
  const [novoBairro, setNovoBairro] = useState("");
  const [novaRegiao, setNovaRegiao] = useState("");
  const [editId, setEditId] = useState<string | null>(null);
  const [editVals, setEditVals] = useState<{ bairro_oficial: string; regiao_urbana: string }>({
    bairro_oficial: "",
    regiao_urbana: "",
  });
  const [openId, setOpenId] = useState<string | null>(null);
  const [novoParc, setNovoParc] = useState("");
  const [novoCepInicio, setNovoCepInicio] = useState("");
  const [novoCepFim, setNovoCepFim] = useState("");
  const [novoCepLog, setNovoCepLog] = useState("");
  const [editParcId, setEditParcId] = useState<string | null>(null);
  const [editParcVal, setEditParcVal] = useState("");
  const [novoSinNome, setNovoSinNome] = useState("");
  const [novoSinBairroId, setNovoSinBairroId] = useState("");
  const [editSinId, setEditSinId] = useState<string | null>(null);
  const [editSinVals, setEditSinVals] = useState({ nome_informado: "", bairro_id: "" });
  const [savingBairro, setSavingBairro] = useState(false);

  const load = async () => {
    try {
      const [b, p, c, s] = await Promise.all([
        fetchAllRows<Bairro>((from, to) =>
          supabase.from("geo_bairros").select("*").eq("ativo", true).order("bairro_oficial").range(from, to),
        ),
        fetchAllRows<Parc>((from, to) =>
          supabase.from("geo_parcelamentos").select("*").eq("ativo", true).order("parcelamento").range(from, to),
        ),
        fetchAllRows<BairroCepRow>((from, to) =>
          supabase.from("geo_bairro_ceps").select("*").eq("ativo", true).order("cep_inicio").range(from, to),
        ),
        fetchAllRows<Sinonimo>((from, to) =>
          supabase.from("geo_sinonimos").select("*").order("nome_informado").range(from, to),
        ),
      ]);
      setBairros(b);
      setParc(p);
      setCeps(c);
      setSinonimos(s);
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : "Falha ao carregar base oficial");
    }
  };
  useEffect(() => {
    load();
  }, []);

  const regioes = useMemo(
    () => Array.from(new Set(bairros.map((b) => b.regiao_urbana).filter(Boolean))) as string[],
    [bairros],
  );

  const parcByB = useMemo(() => {
    const m = new Map<string, Parc[]>();
    for (const x of parc) {
      const a = m.get(x.bairro_id) ?? [];
      a.push(x);
      m.set(x.bairro_id, a);
    }
    for (const [, list] of m) {
      list.sort((a, b) => a.parcelamento.localeCompare(b.parcelamento, "pt-BR"));
    }
    return m;
  }, [parc]);

  const cepsByB = useMemo(() => {
    const m = new Map<string, BairroCepRow[]>();
    for (const x of ceps) {
      const a = m.get(x.bairro_id) ?? [];
      a.push(x);
      m.set(x.bairro_id, a);
    }
    return m;
  }, [ceps]);

  const filtered = useMemo(
    () =>
      bairros.filter((b) => {
        const parcList = parcByB.get(b.id) ?? [];
        const parcText = parcList.map((p) => p.parcelamento).join(" ").toLowerCase();
        const qParc = fParc.toLowerCase();
        return (
          (!fBairro || b.bairro_oficial.toLowerCase().includes(fBairro.toLowerCase())) &&
          (!fRegiao || b.regiao_urbana === fRegiao) &&
          (!fSemParc || parcList.length === 0) &&
          (!qParc || b.bairro_oficial.toLowerCase().includes(qParc) || parcText.includes(qParc))
        );
      }),
    [bairros, fBairro, fRegiao, fParc, fSemParc, parcByB],
  );

  const stats = useMemo(() => {
    const semParc = bairros.filter((b) => !(parcByB.get(b.id) ?? []).length).length;
    return { bairros: bairros.length, parcelamentos: parc.length, semParc };
  }, [bairros, parc, parcByB]);

  const bairroName = useMemo(() => {
    const m = new Map<string, string>();
    for (const b of bairros) m.set(b.id, b.bairro_oficial);
    return m;
  }, [bairros]);

  const filteredSin = useMemo(
    () =>
      sinonimos.filter((s) => {
        if (!fSin) return true;
        const q = fSin.toLowerCase();
        return (
          s.nome_informado.toLowerCase().includes(q) ||
          (bairroName.get(s.bairro_id) ?? "").toLowerCase().includes(q)
        );
      }),
    [sinonimos, fSin, bairroName],
  );

  const addBairro = async () => {
    const nome = novoBairro.trim();
    if (!nome) {
      toast.error("Informe o nome do bairro oficial");
      return;
    }
    const regiao = novaRegiao.trim() || null;

    setSavingBairro(true);
    try {
      const { error } = await supabase
        .from("geo_bairros")
        .upsert(
          { bairro_oficial: nome, regiao_urbana: regiao, ativo: true },
          { onConflict: "bairro_oficial" },
        )
        .select()
        .single();

      if (error) {
        toast.error(error.message);
        return;
      }

      setNovoBairro("");
      setNovaRegiao("");
      setFBairro("");
      setFRegiao("");
      toast.success("Bairro salvo na base oficial");
      await load();
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : "Falha ao cadastrar bairro");
    } finally {
      setSavingBairro(false);
    }
  };

  const delBairro = async (id: string) => {
    if (!confirm("Desativar este bairro e seus parcelamentos?")) return;
    await supabase.from("geo_bairros").update({ ativo: false }).eq("id", id);
    await supabase.from("geo_parcelamentos").update({ ativo: false }).eq("bairro_id", id);
    load();
  };

  const saveEdit = async (id: string) => {
    await supabase
      .from("geo_bairros")
      .update({ bairro_oficial: editVals.bairro_oficial, regiao_urbana: editVals.regiao_urbana || null })
      .eq("id", id);
    setEditId(null);
    load();
  };

  const addParc = async (bairro_id: string) => {
    if (!novoParc.trim()) return;
    await supabase.from("geo_parcelamentos").insert({ bairro_id, parcelamento: novoParc.trim() });
    setNovoParc("");
    load();
  };

  const saveParc = async (id: string) => {
    if (!editParcVal.trim()) return;
    await supabase.from("geo_parcelamentos").update({ parcelamento: editParcVal.trim() }).eq("id", id);
    setEditParcId(null);
    load();
  };

  const delParc = async (id: string) => {
    await supabase.from("geo_parcelamentos").update({ ativo: false }).eq("id", id);
    load();
  };

  const addCep = async (bairro_id: string) => {
    const inicio = normalizeCep(novoCepInicio);
    if (!inicio) return toast.error("Informe um CEP ou prefixo válido (5–8 dígitos)");
    const fim = novoCepFim.trim() ? normalizeCep(novoCepFim) : null;
    const { error } = await supabase.from("geo_bairro_ceps").insert({
      bairro_id,
      cep_inicio: inicio,
      cep_fim: fim,
      logradouro: novoCepLog.trim() || null,
    });
    if (error) return toast.error(error.message);
    setNovoCepInicio("");
    setNovoCepFim("");
    setNovoCepLog("");
    toast.success("CEP cadastrado");
    load();
  };

  const delCep = async (id: string) => {
    await supabase.from("geo_bairro_ceps").update({ ativo: false }).eq("id", id);
    load();
  };

  const addSinonimo = async () => {
    if (!novoSinNome.trim() || !novoSinBairroId) return;
    const { error } = await supabase.from("geo_sinonimos").insert({
      bairro_id: novoSinBairroId,
      nome_informado: novoSinNome.trim(),
      nome_normalizado: normalizeGeo(novoSinNome),
      tipo_correspondencia: "manual",
      confianca: 100,
    });
    if (error) return toast.error(error.message);
    setNovoSinNome("");
    toast.success("Sinônimo cadastrado");
    load();
  };

  const saveSinonimo = async (id: string) => {
    if (!editSinVals.nome_informado.trim() || !editSinVals.bairro_id) return;
    const { error } = await supabase
      .from("geo_sinonimos")
      .update({
        bairro_id: editSinVals.bairro_id,
        nome_informado: editSinVals.nome_informado.trim(),
        nome_normalizado: normalizeGeo(editSinVals.nome_informado),
      })
      .eq("id", id);
    if (error) return toast.error(error.message);
    setEditSinId(null);
    load();
  };

  const delSinonimo = async (id: string) => {
    if (!confirm("Excluir este sinônimo?")) return;
    await supabase.from("geo_sinonimos").delete().eq("id", id);
    load();
  };

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">Base Oficial</h1>
        <p className="text-sm text-muted-foreground">
          Cadastro de bairros oficiais, regiões urbanas, parcelamentos, faixas de CEP/logradouro e sinônimos.
        </p>
      </div>

      <Card>
        <CardHeader>
          <CardTitle>Novo bairro oficial</CardTitle>
        </CardHeader>
        <CardContent>
          <form
            className="flex flex-col gap-2 md:flex-row"
            onSubmit={(e) => {
              e.preventDefault();
              void addBairro();
            }}
          >
            <Input
              placeholder="Bairro oficial (ex: Amambai)"
              value={novoBairro}
              onChange={(e) => setNovoBairro(e.target.value)}
            />
            <Input
              placeholder="Região urbana"
              value={novaRegiao}
              onChange={(e) => setNovaRegiao(e.target.value)}
            />
            <Button type="submit" disabled={savingBairro || !novoBairro.trim()}>
              <Plus className="h-4 w-4" /> {savingBairro ? "Salvando…" : "Adicionar"}
            </Button>
          </form>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Bairros e parcelamentos ({filtered.length} de {stats.bairros})</CardTitle>
          <p className="text-sm text-muted-foreground">
            {stats.parcelamentos} parcelamentos cadastrados
            {stats.semParc > 0 && (
              <span className="text-amber-600"> · {stats.semParc} bairro(s) sem parcelamento</span>
            )}
          </p>
          <div className="mt-2 flex flex-col gap-2">
            <div className="flex flex-col gap-2 md:flex-row">
              <Input placeholder="Filtrar por bairro" value={fBairro} onChange={(e) => setFBairro(e.target.value)} />
              <Input
                placeholder="Filtrar por parcelamento"
                value={fParc}
                onChange={(e) => setFParc(e.target.value)}
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
            <label className="flex cursor-pointer items-center gap-2 text-sm text-muted-foreground">
              <input
                type="checkbox"
                className="rounded border-input"
                checked={fSemParc}
                onChange={(e) => setFSemParc(e.target.checked)}
              />
              Mostrar somente bairros sem parcelamento
            </label>
          </div>
        </CardHeader>
        <CardContent className="overflow-x-auto">
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead className="w-[160px]">Bairro Oficial</TableHead>
                <TableHead className="w-[120px]">Região Urbana</TableHead>
                <TableHead>Parcelamentos</TableHead>
                <TableHead className="w-28 text-right">Ações</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {filtered.flatMap((b) => {
                const rows = [
                  <TableRow key={b.id}>
                    {editId === b.id ? (
                      <>
                        <TableCell>
                          <Input
                            value={editVals.bairro_oficial}
                            onChange={(e) => setEditVals({ ...editVals, bairro_oficial: e.target.value })}
                          />
                        </TableCell>
                        <TableCell>
                          <Input
                            value={editVals.regiao_urbana}
                            onChange={(e) => setEditVals({ ...editVals, regiao_urbana: e.target.value })}
                          />
                        </TableCell>
                        <TableCell className="text-sm text-muted-foreground">—</TableCell>
                        <TableCell className="space-x-1 text-right">
                          <Button size="sm" onClick={() => saveEdit(b.id)}>
                            <Save className="h-3 w-3" />
                          </Button>
                          <Button size="sm" variant="ghost" onClick={() => setEditId(null)}>
                            <X className="h-3 w-3" />
                          </Button>
                        </TableCell>
                      </>
                    ) : (
                      <>
                        <TableCell className="font-medium">{b.bairro_oficial}</TableCell>
                        <TableCell>{b.regiao_urbana ?? "—"}</TableCell>
                        <TableCell>
                          {(parcByB.get(b.id) ?? []).length === 0 ? (
                            <span className="text-sm text-amber-600">Sem parcelamento</span>
                          ) : (
                            <ul className="list-inside list-disc space-y-0.5 text-sm">
                              {(parcByB.get(b.id) ?? []).map((p) => (
                                <li key={p.id}>{p.parcelamento}</li>
                              ))}
                            </ul>
                          )}
                        </TableCell>
                        <TableCell className="space-x-1 text-right">
                          <Button
                            size="sm"
                            variant="ghost"
                            onClick={() => {
                              setEditId(b.id);
                              setEditVals({ bairro_oficial: b.bairro_oficial, regiao_urbana: b.regiao_urbana ?? "" });
                            }}
                            title="Editar bairro"
                          >
                            <Pencil className="h-3 w-3" />
                          </Button>
                          <Button
                            size="sm"
                            variant="outline"
                            onClick={() => setOpenId(openId === b.id ? null : b.id)}
                            title="Gerenciar parcelamentos e CEP"
                          >
                            {openId === b.id ? <ChevronUp className="h-3 w-3" /> : <ChevronDown className="h-3 w-3" />}
                          </Button>
                          <Button size="sm" variant="ghost" onClick={() => delBairro(b.id)}>
                            <Trash2 className="h-3 w-3" />
                          </Button>
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
                          <p className="text-xs font-medium text-muted-foreground">
                            Gerenciar parcelamentos e CEP — {b.bairro_oficial}
                          </p>
                          <div className="flex gap-2">
                            <Input placeholder="Novo parcelamento" value={novoParc} onChange={(e) => setNovoParc(e.target.value)} />
                            <Button size="sm" onClick={() => addParc(b.id)}>
                              <Plus className="h-3 w-3" /> Adicionar
                            </Button>
                          </div>
                          <ul className="space-y-1">
                            {(parcByB.get(b.id) ?? []).map((p) => (
                              <li
                                key={p.id}
                                className="flex items-center justify-between rounded border border-border bg-background px-3 py-1.5 text-sm"
                              >
                                {editParcId === p.id ? (
                                  <div className="flex flex-1 items-center gap-2">
                                    <Input value={editParcVal} onChange={(e) => setEditParcVal(e.target.value)} />
                                    <Button size="sm" onClick={() => saveParc(p.id)}>
                                      <Save className="h-3 w-3" />
                                    </Button>
                                    <Button size="sm" variant="ghost" onClick={() => setEditParcId(null)}>
                                      <X className="h-3 w-3" />
                                    </Button>
                                  </div>
                                ) : (
                                  <>
                                    <span>{p.parcelamento}</span>
                                    <div className="space-x-1">
                                      <Button
                                        size="sm"
                                        variant="ghost"
                                        onClick={() => {
                                          setEditParcId(p.id);
                                          setEditParcVal(p.parcelamento);
                                        }}
                                      >
                                        <Pencil className="h-3 w-3" />
                                      </Button>
                                      <Button size="sm" variant="ghost" onClick={() => delParc(p.id)}>
                                        <Trash2 className="h-3 w-3" />
                                      </Button>
                                    </div>
                                  </>
                                )}
                              </li>
                            ))}
                            {(parcByB.get(b.id) ?? []).length === 0 && (
                              <li className="text-xs text-muted-foreground">Sem parcelamentos cadastrados.</li>
                            )}
                          </ul>
                          <div className="border-t border-border pt-3">
                            <p className="mb-2 text-xs font-medium text-muted-foreground">
                              CEP / logradouro de referência (ajuda na identificação por região)
                            </p>
                            <div className="flex flex-col gap-2 md:flex-row">
                              <Input
                                placeholder="CEP início (79005-120)"
                                value={novoCepInicio}
                                onChange={(e) => setNovoCepInicio(e.target.value)}
                              />
                              <Input
                                placeholder="CEP fim (opcional)"
                                value={novoCepFim}
                                onChange={(e) => setNovoCepFim(e.target.value)}
                              />
                              <Input
                                placeholder="Logradouro referência"
                                value={novoCepLog}
                                onChange={(e) => setNovoCepLog(e.target.value)}
                              />
                              <Button size="sm" onClick={() => addCep(b.id)}>
                                <Plus className="h-3 w-3" /> CEP
                              </Button>
                            </div>
                            <ul className="mt-2 space-y-1">
                              {(cepsByB.get(b.id) ?? []).map((c) => (
                                <li
                                  key={c.id}
                                  className="flex items-center justify-between rounded border border-border bg-background px-3 py-1.5 text-sm"
                                >
                                  <span>
                                    {formatCep(c.cep_inicio)}
                                    {c.cep_fim ? ` — ${formatCep(c.cep_fim)}` : ""}
                                    {c.logradouro ? ` · ${c.logradouro}` : ""}
                                  </span>
                                  <Button size="sm" variant="ghost" onClick={() => delCep(c.id)}>
                                    <Trash2 className="h-3 w-3" />
                                  </Button>
                                </li>
                              ))}
                              {(cepsByB.get(b.id) ?? []).length === 0 && (
                                <li className="text-xs text-muted-foreground">Sem CEP cadastrado.</li>
                              )}
                            </ul>
                          </div>
                        </div>
                      </TableCell>
                    </TableRow>,
                  );
                }
                return rows;
              })}
              {filtered.length === 0 && (
                <TableRow>
                  <TableCell colSpan={4} className="text-center text-sm text-muted-foreground">
                    Nenhum bairro cadastrado.
                  </TableCell>
                </TableRow>
              )}
            </TableBody>
          </Table>
        </CardContent>
      </Card>

      <Card>
        <CardHeader>
          <CardTitle>Sinônimos ({filteredSin.length})</CardTitle>
          <p className="text-sm text-muted-foreground">Grafias alternativas que apontam para bairros oficiais.</p>
        </CardHeader>
        <CardContent className="space-y-4">
          <div className="flex flex-col gap-2 md:flex-row">
            <Input placeholder="Nome informado (ex: JD AMAMBAI)" value={novoSinNome} onChange={(e) => setNovoSinNome(e.target.value)} />
            <select
              className="h-9 rounded-md border border-input bg-background px-3 text-sm"
              value={novoSinBairroId}
              onChange={(e) => setNovoSinBairroId(e.target.value)}
            >
              <option value="">— bairro oficial —</option>
              {bairros.map((b) => (
                <option key={b.id} value={b.id}>
                  {b.bairro_oficial}
                </option>
              ))}
            </select>
            <Button onClick={addSinonimo} disabled={!novoSinNome.trim() || !novoSinBairroId}>
              <Plus className="h-4 w-4" /> Adicionar
            </Button>
          </div>
          <Input placeholder="Filtrar sinônimos" value={fSin} onChange={(e) => setFSin(e.target.value)} />
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead>Nome Informado</TableHead>
                <TableHead>Bairro Oficial</TableHead>
                <TableHead>Tipo</TableHead>
                <TableHead className="w-28 text-right">Ações</TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {filteredSin.map((s) => (
                <TableRow key={s.id}>
                  {editSinId === s.id ? (
                    <>
                      <TableCell>
                        <Input
                          value={editSinVals.nome_informado}
                          onChange={(e) => setEditSinVals({ ...editSinVals, nome_informado: e.target.value })}
                        />
                      </TableCell>
                      <TableCell>
                        <select
                          className="h-8 w-full rounded-md border border-input bg-background px-2 text-sm"
                          value={editSinVals.bairro_id}
                          onChange={(e) => setEditSinVals({ ...editSinVals, bairro_id: e.target.value })}
                        >
                          {bairros.map((b) => (
                            <option key={b.id} value={b.id}>
                              {b.bairro_oficial}
                            </option>
                          ))}
                        </select>
                      </TableCell>
                      <TableCell>{s.tipo_correspondencia}</TableCell>
                      <TableCell className="space-x-1 text-right">
                        <Button size="sm" onClick={() => saveSinonimo(s.id)}>
                          <Save className="h-3 w-3" />
                        </Button>
                        <Button size="sm" variant="ghost" onClick={() => setEditSinId(null)}>
                          <X className="h-3 w-3" />
                        </Button>
                      </TableCell>
                    </>
                  ) : (
                    <>
                      <TableCell>{s.nome_informado}</TableCell>
                      <TableCell>{bairroName.get(s.bairro_id) ?? "—"}</TableCell>
                      <TableCell>{s.tipo_correspondencia}</TableCell>
                      <TableCell className="space-x-1 text-right">
                        <Button
                          size="sm"
                          variant="ghost"
                          onClick={() => {
                            setEditSinId(s.id);
                            setEditSinVals({ nome_informado: s.nome_informado, bairro_id: s.bairro_id });
                          }}
                        >
                          <Pencil className="h-3 w-3" />
                        </Button>
                        <Button size="sm" variant="ghost" onClick={() => delSinonimo(s.id)}>
                          <Trash2 className="h-3 w-3" />
                        </Button>
                      </TableCell>
                    </>
                  )}
                </TableRow>
              ))}
              {filteredSin.length === 0 && (
                <TableRow>
                  <TableCell colSpan={4} className="text-center text-sm text-muted-foreground">
                    Nenhum sinônimo cadastrado.
                  </TableCell>
                </TableRow>
              )}
            </TableBody>
          </Table>
        </CardContent>
      </Card>
    </div>
  );
}
