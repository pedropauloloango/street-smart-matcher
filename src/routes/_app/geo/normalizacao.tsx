import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Progress } from "@/components/ui/progress";
import { Wand2 } from "lucide-react";
import { geoStore, useGeoStore } from "@/lib/geo/store";
import { loadGeoDataset, matchOne } from "@/lib/geo/match";
import { fetchResultados } from "@/lib/geo/api";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";

export const Route = createFileRoute("/_app/geo/normalizacao")({
  component: NormalizacaoPage,
});

function NormalizacaoPage() {
  const rows = useGeoStore((s) => s.rows);
  const col = useGeoStore((s) => s.bairroColumn);
  const logCol = useGeoStore((s) => s.logradouroColumn);
  const cepCol = useGeoStore((s) => s.cepColumn);
  const fileName = useGeoStore((s) => s.fileName);
  const [progress, setProgress] = useState(0);
  const [running, setRunning] = useState(false);
  const navigate = useNavigate();

  const run = async () => {
    if (!col) return toast.error("Selecione a coluna do bairro");
    setRunning(true); setProgress(0);
    try {
      const ds = await loadGeoDataset();
      if (!ds.bairros.length) { toast.error("Cadastre bairros na Base Oficial antes."); setRunning(false); return; }

      const results = [];
      const chunk = 500;
      for (let i = 0; i < rows.length; i++) {
        const original = String(rows[i][col] ?? "");
        const logradouro = logCol ? String(rows[i][logCol] ?? "").trim() || null : null;
        const cep = cepCol ? String(rows[i][cepCol] ?? "").trim() || null : null;
        results.push(matchOne(original, ds, i + 1, { logradouro, cep }));
        if (i % chunk === 0) {
          setProgress(Math.round((i / rows.length) * 100));
          await new Promise((r) => setTimeout(r, 0));
        }
      }
      setProgress(100);

      const enc = results.filter((r) => r.status_match === "encontrado").length;
      const sim = results.filter((r) => r.status_match === "similaridade").length;
      const nao = results.length - enc - sim;

      const sb = supabase as any;
      const { data: imp, error: impErr } = await sb.from("geo_importacoes").insert({
        nome_arquivo: fileName ?? "sem-nome",
        total_registros: results.length,
        encontrados: enc, similares: sim, nao_encontrados: nao,
        status: "concluido",
      }).select().single();
      if (impErr) throw impErr;

      const importacao_id = imp.id;
      // Persistir em lotes
      for (let i = 0; i < results.length; i += 500) {
        const batch = results.slice(i, i + 500).map((r) => ({
          importacao_id,
          linha_original: r.linha,
          bairro_original: r.bairro_original,
          logradouro: r.logradouro,
          cep: r.cep,
          bairro_oficial: r.bairro_oficial,
          parcelamento: r.parcelamento,
          regiao_urbana: r.regiao_urbana,
          status_match: r.status_match,
          percentual_confianca: r.percentual_confianca,
        }));
        await sb.from("geo_resultados").insert(batch);
      }

      geoStore.set({ results, importacaoId: importacao_id });
      const persisted = await fetchResultados(importacao_id);
      geoStore.set({ results: persisted, importacaoId: importacao_id });
      toast.success(`${enc + sim} de ${results.length} bairros normalizados (${Math.round(((enc + sim) / results.length) * 100)}%)`);
      navigate({ to: "/geo/resultado" });
    } catch (e: any) {
      toast.error(e.message ?? "Falha na normalização");
    } finally { setRunning(false); }
  };

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">Normalização</h1>
        <p className="text-sm text-muted-foreground">Aplica correspondência exata, sinônimos e similaridade (Levenshtein).</p>
      </div>

      <Card>
        <CardHeader><CardTitle>Pronto para processar</CardTitle></CardHeader>
        <CardContent className="space-y-4">
          {fileName ? (
            <>
              <p className="text-sm">Arquivo: <span className="font-medium">{fileName}</span></p>
              <p className="text-sm">Coluna do bairro: <span className="font-medium">{col ?? "—"}</span></p>
              {(logCol || cepCol) && (
                <p className="text-sm">
                  Endereço:{" "}
                  <span className="font-medium">
                    {[logCol && `logradouro (${logCol})`, cepCol && `CEP (${cepCol})`].filter(Boolean).join(" · ")}
                  </span>
                </p>
              )}
              <p className="text-sm">Total de registros: <span className="font-medium">{rows.length}</span></p>
              <div className="rounded-md bg-muted/40 p-3 text-xs text-muted-foreground">
                Etapas: 1) normalização (acentos, maiúsculas, pontuação, abreviações) · 2) correspondência exata · 3) sinônimos cadastrados · 4) similaridade ≥ 85%.
              </div>
              {running && <Progress value={progress} />}
              <div className="flex justify-end">
                <Button onClick={run} disabled={running || !col}>
                  <Wand2 className="h-4 w-4" /> {running ? `Processando ${progress}%` : "Iniciar normalização"}
                </Button>
              </div>
            </>
          ) : (
            <p className="text-sm text-muted-foreground">Importe uma planilha antes em <strong>Importar Planilha</strong>.</p>
          )}
        </CardContent>
      </Card>
    </div>
  );
}
