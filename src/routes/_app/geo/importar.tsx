import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useCallback, useState } from "react";
import { useDropzone } from "react-dropzone";
import { Upload, FileSpreadsheet, Download, FileText } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { readSheet, guessBairroColumn, guessLogradouroColumn, guessCepColumn } from "@/lib/geo/io";
import { downloadImportTemplate, IMPORT_TEMPLATE_ROWS } from "@/lib/geo/import-template";
import { geoStore, useGeoStore } from "@/lib/geo/store";
import { toast } from "sonner";

export const Route = createFileRoute("/_app/geo/importar")({
  component: ImportarPage,
});

function ImportarPage() {
  const fileName = useGeoStore((s) => s.fileName);
  const headers = useGeoStore((s) => s.headers);
  const rows = useGeoStore((s) => s.rows);
  const bairroColumn = useGeoStore((s) => s.bairroColumn);
  const logradouroColumn = useGeoStore((s) => s.logradouroColumn);
  const cepColumn = useGeoStore((s) => s.cepColumn);
  const [busy, setBusy] = useState(false);
  const navigate = useNavigate();

  const onDrop = useCallback(async (files: File[]) => {
    const f = files[0]; if (!f) return;
    setBusy(true);
    try {
      const { headers, rows } = await readSheet(f);
      if (!rows.length) { toast.error("Planilha vazia"); return; }
      const col = guessBairroColumn(headers);
      const logCol = guessLogradouroColumn(headers);
      const cepCol = guessCepColumn(headers);
      geoStore.set({
        fileName: f.name,
        headers,
        rows,
        bairroColumn: col,
        logradouroColumn: logCol,
        cepColumn: cepCol,
        results: [],
        importacaoId: null,
      });
      toast.success(`Carregados ${rows.length} registros`);
    } catch (e: any) {
      toast.error(e.message ?? "Falha ao ler planilha");
    } finally { setBusy(false); }
  }, []);

  const { getRootProps, getInputProps, isDragActive } = useDropzone({
    onDrop, multiple: false,
    accept: { "text/csv": [".csv"], "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet": [".xlsx"], "application/vnd.ms-excel": [".xls"] },
  });

  const preview = rows.slice(0, 5);

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-2xl font-semibold">Importar Planilha</h1>
        <p className="text-sm text-muted-foreground">
          Aceita arquivos CSV e XLSX. Selecione as colunas de bairro, logradouro e CEP (opcionais).
        </p>
      </div>

      <Card>
        <CardHeader>
          <CardTitle className="text-base">Planilha modelo</CardTitle>
          <CardDescription>
            Baixe um arquivo de exemplo com {IMPORT_TEMPLATE_ROWS.length} bairros em grafias variadas (abreviações,
            acentos, maiúsculas/minúsculas e casos para teste de similaridade).
          </CardDescription>
        </CardHeader>
        <CardContent className="flex flex-wrap gap-2">
          <Button variant="outline" onClick={() => downloadImportTemplate("xlsx")}>
            <Download className="h-4 w-4" />
            Baixar modelo (.xlsx)
          </Button>
          <Button variant="outline" onClick={() => downloadImportTemplate("csv")}>
            <FileText className="h-4 w-4" />
            Baixar modelo (.csv)
          </Button>
        </CardContent>
      </Card>

      <Card>
        <CardContent className="p-0">
          <div
            {...getRootProps()}
            className={"flex flex-col items-center justify-center gap-2 rounded-xl border-2 border-dashed p-12 transition-colors cursor-pointer " +
              (isDragActive ? "border-primary bg-primary/5" : "border-border hover:bg-muted/30")}
          >
            <input {...getInputProps()} />
            <Upload className="h-8 w-8 text-muted-foreground" />
            <p className="text-sm font-medium">{busy ? "Lendo planilha..." : "Arraste o arquivo ou clique para selecionar"}</p>
            <p className="text-xs text-muted-foreground">CSV ou XLSX</p>
          </div>
        </CardContent>
      </Card>

      {fileName && (
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2"><FileSpreadsheet className="h-4 w-4" /> {fileName}</CardTitle>
            <p className="text-xs text-muted-foreground">{rows.length} registros · {headers.length} colunas</p>
          </CardHeader>
          <CardContent className="space-y-4">
            <div className="grid gap-3 md:grid-cols-3">
              <div className="flex flex-col gap-1">
                <label className="text-sm font-medium">Coluna do bairro *</label>
                <select
                  className="h-9 rounded-md border border-input bg-background px-3 text-sm"
                  value={bairroColumn ?? ""}
                  onChange={(e) => geoStore.set({ bairroColumn: e.target.value || null })}
                >
                  <option value="">— selecione —</option>
                  {headers.map((h) => (
                    <option key={h} value={h}>
                      {h}
                    </option>
                  ))}
                </select>
              </div>
              <div className="flex flex-col gap-1">
                <label className="text-sm font-medium">Coluna logradouro</label>
                <select
                  className="h-9 rounded-md border border-input bg-background px-3 text-sm"
                  value={logradouroColumn ?? ""}
                  onChange={(e) => geoStore.set({ logradouroColumn: e.target.value || null })}
                >
                  <option value="">— opcional —</option>
                  {headers.map((h) => (
                    <option key={h} value={h}>
                      {h}
                    </option>
                  ))}
                </select>
              </div>
              <div className="flex flex-col gap-1">
                <label className="text-sm font-medium">Coluna CEP</label>
                <select
                  className="h-9 rounded-md border border-input bg-background px-3 text-sm"
                  value={cepColumn ?? ""}
                  onChange={(e) => geoStore.set({ cepColumn: e.target.value || null })}
                >
                  <option value="">— opcional —</option>
                  {headers.map((h) => (
                    <option key={h} value={h}>
                      {h}
                    </option>
                  ))}
                </select>
              </div>
            </div>
            {(logradouroColumn || cepColumn) && (
              <p className="text-xs text-emerald-600">
                Logradouro e CEP ajudam a identificar a região correta do bairro oficial.
              </p>
            )}

            <div className="overflow-x-auto">
              <Table>
                <TableHeader>
                  <TableRow>{headers.map((h) => <TableHead key={h}>{h}</TableHead>)}</TableRow>
                </TableHeader>
                <TableBody>
                  {preview.map((r, i) => (
                    <TableRow key={i}>
                      {headers.map((h) => <TableCell key={h}>{String(r[h] ?? "")}</TableCell>)}
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </div>

            <div className="flex justify-end">
              <Button disabled={!bairroColumn} onClick={() => navigate({ to: "/geo/normalizacao" })}>
                Avançar para normalização
              </Button>
            </div>
          </CardContent>
        </Card>
      )}
    </div>
  );
}
