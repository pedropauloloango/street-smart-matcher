import { createFileRoute } from "@tanstack/react-router";
import { useMemo, useState } from "react";
import { FileDropzone } from "@/components/FileDropzone";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { Input } from "@/components/ui/input";
import { Badge } from "@/components/ui/badge";
import { toast } from "sonner";
import { Toaster } from "@/components/ui/sonner";
import { Download, Play, Save, Sparkles, AlertTriangle, CheckCircle2, Database } from "lucide-react";
import { readSpreadsheet, sisgranFromRows, matchRows, exportToXlsx, type MatchedRow, type SisgranEntry } from "@/lib/processing";
import { normalizeBairro } from "@/lib/normalize";
import { supabase } from "@/integrations/supabase/client";

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "Processar planilhas · BairroMatch" },
      { name: "description", content: "Envie a planilha da Receita e a referência SISGRAN para padronizar os bairros de Campo Grande-MS." },
    ],
  }),
  component: ProcessarPage,
});

function ProcessarPage() {
  const [receitaFile, setReceitaFile] = useState<File | null>(null);
  const [sisgranFile, setSisgranFile] = useState<File | null>(null);
  const [processing, setProcessing] = useState(false);
  const [progress, setProgress] = useState(0);
  const [rows, setRows] = useState<MatchedRow[] | null>(null);
  const [sisgranEntries, setSisgranEntries] = useState<SisgranEntry[]>([]);
  const [filterUnmatched, setFilterUnmatched] = useState(false);
  const [savingId, setSavingId] = useState<number | null>(null);

  const stats = useMemo(() => {
    if (!rows) return null;
    const matched = rows.filter((r) => r.__matched).length;
    const total = rows.length;
    const unmatched = total - matched;
    const avg = matched > 0 ? rows.filter((r) => r.__matched).reduce((s, r) => s + r.__score, 0) / matched : 0;
    return { total, matched, unmatched, percent: total ? (matched / total) * 100 : 0, avg };
  }, [rows]);

  const handleProcess = async () => {
    if (!receitaFile) return toast.error("Envie a planilha da Receita Federal.");
    if (!sisgranFile && sisgranEntries.length === 0) return toast.error("Envie a planilha de referência SISGRAN.");

    setProcessing(true);
    setProgress(5);
    try {
      // 1) Carrega dicionário aprendido do banco
      const { data: dictData, error: dictErr } = await supabase
        .from("bairros_dicionario")
        .select("bairro_normalizado,bairro_oficial,parcelamento,regiao_urbana");
      if (dictErr) throw dictErr;
      const dictionary: SisgranEntry[] = (dictData ?? []) as any;

      // 2) Lê SISGRAN
      let sisgran = sisgranEntries;
      if (sisgranFile) {
        setProgress(15);
        const sisgranRows = await readSpreadsheet(sisgranFile);
        sisgran = sisgranFromRows(sisgranRows);
        setSisgranEntries(sisgran);
      }

      // 3) Lê Receita
      setProgress(35);
      const receita = await readSpreadsheet(receitaFile!);
      setProgress(55);

      // 4) Match (com progresso)
      const matched = matchRows(receita as any, {
        dictionary,
        sisgran,
        threshold: 0.35,
        onProgress: (done, total) => {
          const pct = 55 + Math.round((done / total) * 40);
          setProgress(pct);
        },
      });

      setRows(matched);
      setProgress(100);

      const matchedCount = matched.filter((r) => r.__matched).length;
      const pct = matched.length ? (matchedCount / matched.length) * 100 : 0;

      // 5) Salva histórico
      await supabase.from("processamentos").insert({
        nome_arquivo: receitaFile!.name,
        total_registros: matched.length,
        matched: matchedCount,
        unmatched: matched.length - matchedCount,
        percentual: Number(pct.toFixed(2)),
      });

      toast.success(`Processado: ${matchedCount}/${matched.length} (${pct.toFixed(1)}%)`);
    } catch (e: any) {
      console.error(e);
      toast.error(e?.message ?? "Erro ao processar.");
    } finally {
      setProcessing(false);
    }
  };

  const handleExport = () => {
    if (!rows) return;
    exportToXlsx(rows, `bairromatch_${Date.now()}.xlsx`);
    toast.success("Arquivo exportado.");
  };

  const handleSaveCorrection = async (idx: number, row: MatchedRow, oficial: string, parcel: string, regiao: string) => {
    if (!oficial.trim()) return toast.error("Informe o bairro oficial.");
    setSavingId(idx);
    try {
      const norm = row.__bairro_normalizado || normalizeBairro(row.__bairro_input);
      const { error } = await supabase.from("bairros_dicionario").upsert(
        {
          bairro_normalizado: norm,
          bairro_oficial: oficial.trim(),
          parcelamento: parcel.trim() || null,
          regiao_urbana: regiao.trim() || null,
          origem: "correcao",
        },
        { onConflict: "bairro_normalizado" },
      );
      if (error) throw error;
      // atualiza linha localmente
      setRows((prev) =>
        prev
          ? prev.map((r, i) =>
              i === idx
                ? { ...r, __bairro_oficial: oficial.trim(), __parcelamento: parcel.trim() || null, __regiao_urbana: regiao.trim() || null, __score: 100, __matched: true }
                : r,
            )
          : prev,
      );
      toast.success("Correção salva no dicionário.");
    } catch (e: any) {
      toast.error(e?.message ?? "Erro ao salvar.");
    } finally {
      setSavingId(null);
    }
  };

  const visibleRows = useMemo(() => {
    if (!rows) return [];
    const filtered = filterUnmatched ? rows.filter((r) => !r.__matched) : rows;
    return filtered.slice(0, 500); // performance
  }, [rows, filterUnmatched]);

  return (
    <div className="space-y-8">
      <Toaster richColors position="top-right" />

      {/* Hero */}
      <section className="relative overflow-hidden rounded-2xl border border-border/60 bg-gradient-brand p-8 text-white shadow-glow">
        <div className="relative z-10 max-w-3xl">
          <div className="inline-flex items-center gap-2 rounded-full bg-white/15 px-3 py-1 text-xs font-medium backdrop-blur">
            <Sparkles className="h-3.5 w-3.5" />
            Padronização inteligente
          </div>
          <h1 className="mt-3 text-3xl font-bold sm:text-4xl">Concilie bairros Receita ↔ SISGRAN</h1>
          <p className="mt-2 max-w-xl text-sm text-white/85">
            Envie sua planilha da Receita Federal e a referência do SISGRAN. O sistema normaliza, expande abreviações e
            aplica fuzzy matching para retornar bairro oficial, parcelamento e região urbana.
          </p>
        </div>
        <div className="absolute -right-12 -top-12 h-64 w-64 rounded-full bg-white/10 blur-3xl" />
      </section>

      {/* Uploads */}
      <section className="grid gap-4 md:grid-cols-2">
        <FileDropzone
          label="Planilha da Receita Federal"
          description="Empresas com colunas como Tipo Logradouro, Logradouro, Número, Bairro, CEP."
          file={receitaFile}
          onFile={setReceitaFile}
        />
        <FileDropzone
          label="Referência SISGRAN · Campo Grande-MS"
          description="Bairros oficiais, parcelamento e região urbana."
          file={sisgranFile}
          onFile={setSisgranFile}
          accent="accent"
        />
      </section>

      <div className="flex flex-wrap items-center gap-3">
        <Button onClick={handleProcess} disabled={processing || !receitaFile} size="lg" className="gap-2">
          <Play className="h-4 w-4" />
          {processing ? "Processando…" : "Processar planilha"}
        </Button>
        {rows && (
          <Button variant="outline" onClick={handleExport} size="lg" className="gap-2">
            <Download className="h-4 w-4" />
            Exportar XLSX
          </Button>
        )}
        {sisgranEntries.length > 0 && (
          <Badge variant="secondary" className="gap-1">
            <Database className="h-3 w-3" />
            {sisgranEntries.length} bairros SISGRAN carregados
          </Badge>
        )}
      </div>

      {processing && (
        <div className="space-y-2">
          <Progress value={progress} />
          <p className="text-xs text-muted-foreground">{progress}% concluído</p>
        </div>
      )}

      {/* Resultados */}
      {stats && (
        <section className="space-y-4">
          <div className="grid gap-3 sm:grid-cols-4">
            <StatCard label="Registros" value={stats.total.toLocaleString("pt-BR")} icon={<Database className="h-4 w-4" />} />
            <StatCard label="Correspondências" value={`${stats.matched.toLocaleString("pt-BR")}`} accent="success" icon={<CheckCircle2 className="h-4 w-4" />} />
            <StatCard label="Sem correspondência" value={stats.unmatched.toLocaleString("pt-BR")} accent="warning" icon={<AlertTriangle className="h-4 w-4" />} />
            <StatCard label="% Correspondência" value={`${stats.percent.toFixed(1)}%`} accent="primary" />
          </div>

          <div className="flex items-center justify-between">
            <h2 className="text-lg font-semibold">Resultados</h2>
            <label className="flex items-center gap-2 text-sm">
              <input
                type="checkbox"
                checked={filterUnmatched}
                onChange={(e) => setFilterUnmatched(e.target.checked)}
                className="h-4 w-4 rounded border-input"
              />
              Mostrar apenas sem correspondência
            </label>
          </div>

          <ResultsTable rows={visibleRows} onSave={handleSaveCorrection} savingId={savingId} />
          {rows && visibleRows.length < (filterUnmatched ? rows.filter((r) => !r.__matched).length : rows.length) && (
            <p className="text-center text-xs text-muted-foreground">
              Exibindo {visibleRows.length} de {filterUnmatched ? rows.filter((r) => !r.__matched).length : rows.length} registros · use Exportar XLSX para o resultado completo.
            </p>
          )}
        </section>
      )}
    </div>
  );
}

function StatCard({
  label,
  value,
  accent = "default",
  icon,
}: {
  label: string;
  value: string;
  accent?: "default" | "success" | "warning" | "primary";
  icon?: React.ReactNode;
}) {
  const accentClass =
    accent === "success"
      ? "text-success"
      : accent === "warning"
        ? "text-warning"
        : accent === "primary"
          ? "text-gradient-brand"
          : "text-foreground";
  return (
    <div className="rounded-xl border border-border/60 bg-surface p-4 shadow-soft">
      <div className="flex items-center justify-between">
        <p className="text-xs font-medium uppercase tracking-wide text-muted-foreground">{label}</p>
        {icon && <span className="text-muted-foreground">{icon}</span>}
      </div>
      <p className={`mt-1 text-2xl font-bold ${accentClass}`}>{value}</p>
    </div>
  );
}

function ResultsTable({
  rows,
  onSave,
  savingId,
}: {
  rows: MatchedRow[];
  onSave: (idx: number, row: MatchedRow, oficial: string, parcel: string, regiao: string) => void;
  savingId: number | null;
}) {
  return (
    <div className="overflow-x-auto rounded-xl border border-border/60 bg-surface shadow-soft">
      <table className="min-w-full text-sm">
        <thead className="bg-secondary/60 text-xs uppercase text-muted-foreground">
          <tr>
            <th className="px-3 py-2 text-left">Bairro (input)</th>
            <th className="px-3 py-2 text-left">Bairro Oficial</th>
            <th className="px-3 py-2 text-left">Parcelamento</th>
            <th className="px-3 py-2 text-left">Região Urbana</th>
            <th className="px-3 py-2 text-left">Score</th>
            <th className="px-3 py-2 text-left">Ação</th>
          </tr>
        </thead>
        <tbody className="divide-y divide-border/60">
          {rows.map((r, i) => (
            <Row key={i} row={r} index={i} onSave={onSave} saving={savingId === i} />
          ))}
          {rows.length === 0 && (
            <tr>
              <td colSpan={6} className="px-3 py-8 text-center text-muted-foreground">Sem registros para exibir.</td>
            </tr>
          )}
        </tbody>
      </table>
    </div>
  );
}

function Row({
  row,
  index,
  onSave,
  saving,
}: {
  row: MatchedRow;
  index: number;
  onSave: (idx: number, row: MatchedRow, oficial: string, parcel: string, regiao: string) => void;
  saving: boolean;
}) {
  const [oficial, setOficial] = useState(row.__bairro_oficial ?? "");
  const [parcel, setParcel] = useState(row.__parcelamento ?? "");
  const [regiao, setRegiao] = useState(row.__regiao_urbana ?? "");
  const editing = !row.__matched;

  return (
    <tr className={editing ? "bg-warning/5" : undefined}>
      <td className="px-3 py-2">
        <div className="font-medium">{row.__bairro_input || "—"}</div>
        <div className="text-xs text-muted-foreground">{row.__bairro_normalizado}</div>
      </td>
      <td className="px-3 py-2">
        {editing ? (
          <Input value={oficial} onChange={(e) => setOficial(e.target.value)} placeholder="Bairro oficial" className="h-8" />
        ) : (
          <span>{row.__bairro_oficial}</span>
        )}
      </td>
      <td className="px-3 py-2">
        {editing ? (
          <Input value={parcel} onChange={(e) => setParcel(e.target.value)} placeholder="Parcelamento" className="h-8" />
        ) : (
          <span className="text-muted-foreground">{row.__parcelamento ?? "—"}</span>
        )}
      </td>
      <td className="px-3 py-2">
        {editing ? (
          <Input value={regiao} onChange={(e) => setRegiao(e.target.value)} placeholder="Região urbana" className="h-8" />
        ) : (
          <span className="text-muted-foreground">{row.__regiao_urbana ?? "—"}</span>
        )}
      </td>
      <td className="px-3 py-2">
        <ScoreBadge score={row.__score} matched={row.__matched} />
      </td>
      <td className="px-3 py-2">
        {editing ? (
          <Button size="sm" variant="secondary" className="gap-1" disabled={saving} onClick={() => onSave(index, row, oficial, parcel, regiao)}>
            <Save className="h-3.5 w-3.5" />
            {saving ? "Salvando…" : "Salvar"}
          </Button>
        ) : (
          <span className="text-xs text-muted-foreground">OK</span>
        )}
      </td>
    </tr>
  );
}

function ScoreBadge({ score, matched }: { score: number; matched: boolean }) {
  if (!matched) return <Badge variant="outline" className="border-warning/40 text-warning">sem match</Badge>;
  const tone = score >= 95 ? "bg-success/15 text-success" : score >= 80 ? "bg-primary/10 text-primary" : "bg-warning/15 text-warning";
  return <span className={`inline-flex items-center rounded-full px-2 py-0.5 text-xs font-semibold ${tone}`}>{score}%</span>;
}
