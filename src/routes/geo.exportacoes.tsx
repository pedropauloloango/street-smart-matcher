import { createFileRoute } from "@tanstack/react-router";
import { useCallback, useEffect, useState } from "react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Download, FileSpreadsheet, FileText } from "lucide-react";
import { GeoImportSelector } from "@/components/geo/GeoImportSelector";
import { useGeoStore } from "@/lib/geo/store";
import { fetchResultados, statusLabel } from "@/lib/geo/api";
import { exportXLSX, exportCSV } from "@/lib/geo/io";
import { toast } from "sonner";

export const Route = createFileRoute("/geo/exportacoes")({
  component: ExportacoesPage,
});

function ExportacoesPage() {
  const importacaoId = useGeoStore((s) => s.importacaoId);
  const fileName = useGeoStore((s) => s.fileName);
  const storeResults = useGeoStore((s) => s.results);
  const [results, setResults] = useState(storeResults);
  const [loading, setLoading] = useState(false);

  const load = useCallback(async (impId: string | null) => {
    if (!impId) {
      setResults([]);
      return;
    }
    setLoading(true);
    try {
      const rows = await fetchResultados(impId);
      setResults(rows);
    } catch (e: unknown) {
      toast.error(e instanceof Error ? e.message : "Falha ao carregar resultados");
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    if (importacaoId) load(importacaoId);
  }, [importacaoId, load]);

  const build = () =>
    results.map((r) => ({
      "Linha Original": r.linha,
      "Bairro Original": r.bairro_original,
      "Bairro Oficial": r.bairro_oficial ?? "",
      Parcelamento: r.parcelamento ?? "",
      "Região Urbana": r.regiao_urbana ?? "",
      Confiança: r.percentual_confianca,
      Status: statusLabel(r.status_match),
    }));

  const base = (fileName?.replace(/\.[^.]+$/, "") ?? "geobairros") + "-normalizado";

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">Exportações</h1>
        <p className="text-sm text-muted-foreground">Baixe o resultado da normalização em XLSX ou CSV.</p>
      </div>

      <Card>
        <CardContent className="pt-6">
          <GeoImportSelector onSelect={(imp) => imp && load(imp.id)} />
        </CardContent>
      </Card>

      {loading ? (
        <Card>
          <CardContent className="p-8 text-center text-sm text-muted-foreground">Carregando resultados...</CardContent>
        </Card>
      ) : results.length === 0 ? (
        <Card>
          <CardContent className="p-8 text-center text-sm text-muted-foreground">
            Nenhum resultado disponível. Execute uma normalização ou selecione outra importação.
          </CardContent>
        </Card>
      ) : (
        <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <FileSpreadsheet className="h-4 w-4" /> Excel (.xlsx)
              </CardTitle>
            </CardHeader>
            <CardContent>
              <p className="mb-3 text-sm text-muted-foreground">{results.length} registros incluídos.</p>
              <Button onClick={() => exportXLSX(build(), `${base}.xlsx`)}>
                <Download className="h-4 w-4" /> Baixar XLSX
              </Button>
            </CardContent>
          </Card>
          <Card>
            <CardHeader>
              <CardTitle className="flex items-center gap-2">
                <FileText className="h-4 w-4" /> CSV
              </CardTitle>
            </CardHeader>
            <CardContent>
              <p className="mb-3 text-sm text-muted-foreground">Compatível com qualquer planilha.</p>
              <Button variant="outline" onClick={() => exportCSV(build(), `${base}.csv`)}>
                <Download className="h-4 w-4" /> Baixar CSV
              </Button>
            </CardContent>
          </Card>
        </div>
      )}
    </div>
  );
}
