import { createFileRoute } from "@tanstack/react-router";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Download, FileSpreadsheet, FileText } from "lucide-react";
import { useGeoStore } from "@/lib/geo/store";
import { exportXLSX, exportCSV } from "@/lib/geo/io";

export const Route = createFileRoute("/geo/exportacoes")({
  component: ExportacoesPage,
});

function ExportacoesPage() {
  const results = useGeoStore((s) => s.results);
  const fileName = useGeoStore((s) => s.fileName);

  const build = () => results.map((r) => ({
    "Linha Original": r.linha,
    "Bairro Original": r.bairro_original,
    "Bairro Oficial": r.bairro_oficial ?? "",
    "Parcelamento": r.parcelamento ?? "",
    "Região Urbana": r.regiao_urbana ?? "",
    "Confiança": r.percentual_confianca,
    "Status": r.status_match,
  }));

  const base = (fileName?.replace(/\.[^.]+$/, "") ?? "geobairros") + "-normalizado";

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">Exportações</h1>
        <p className="text-sm text-muted-foreground">Baixe o resultado da normalização em XLSX ou CSV.</p>
      </div>

      {results.length === 0 ? (
        <Card><CardContent className="p-8 text-center text-sm text-muted-foreground">
          Nenhum resultado disponível. Execute uma normalização primeiro.
        </CardContent></Card>
      ) : (
        <div className="grid grid-cols-1 gap-4 md:grid-cols-2">
          <Card>
            <CardHeader><CardTitle className="flex items-center gap-2"><FileSpreadsheet className="h-4 w-4" /> Excel (.xlsx)</CardTitle></CardHeader>
            <CardContent>
              <p className="mb-3 text-sm text-muted-foreground">{results.length} registros incluídos.</p>
              <Button onClick={() => exportXLSX(build(), `${base}.xlsx`)}>
                <Download className="h-4 w-4" /> Baixar XLSX
              </Button>
            </CardContent>
          </Card>
          <Card>
            <CardHeader><CardTitle className="flex items-center gap-2"><FileText className="h-4 w-4" /> CSV</CardTitle></CardHeader>
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
