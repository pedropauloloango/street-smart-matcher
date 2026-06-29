// Leitura/escrita de planilhas (XLSX/CSV) para o módulo GeoBairros CG
import * as XLSX from "xlsx";

export type Row = Record<string, unknown>;

export async function readSheet(file: File): Promise<{ headers: string[]; rows: Row[] }> {
  const buf = await file.arrayBuffer();
  const wb = XLSX.read(buf, { type: "array" });
  const ws = wb.Sheets[wb.SheetNames[0]];
  const json = XLSX.utils.sheet_to_json<Row>(ws, { defval: "" });
  const headers = json.length ? Object.keys(json[0]) : [];
  return { headers, rows: json };
}

export function guessBairroColumn(headers: string[]): string | null {
  const candidates = ["BAIRRO", "NOME_BAIRRO", "NM_BAIRRO"];
  const norm = (s: string) => s.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toUpperCase().trim();
  for (const h of headers) {
    const n = norm(h);
    if (candidates.includes(n)) return h;
  }
  for (const h of headers) {
    const n = norm(h);
    if (n.includes("BAIRRO") && !n.includes("OFICIAL")) return h;
  }
  return null;
}

export function guessLogradouroColumn(headers: string[]): string | null {
  const candidates = ["LOGRADOURO", "ENDERECO", "ENDEREÇO", "RUA", "END"];
  const norm = (s: string) => s.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toUpperCase().trim();
  for (const h of headers) {
    if (candidates.includes(norm(h))) return h;
  }
  for (const h of headers) {
    const n = norm(h);
    if (n.includes("LOGRADOURO") || n.includes("ENDERECO")) return h;
  }
  return null;
}

export function guessCepColumn(headers: string[]): string | null {
  const norm = (s: string) => s.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toUpperCase().trim();
  for (const h of headers) {
    const n = norm(h);
    if (n === "CEP" || n.startsWith("CEP ") || n.includes("CODIGO POSTAL")) return h;
  }
  return null;
}

export function exportXLSX(rows: Row[], filename: string) {
  const ws = XLSX.utils.json_to_sheet(rows);
  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, "Resultado");
  XLSX.writeFile(wb, filename);
}

export function exportCSV(rows: Row[], filename: string) {
  const ws = XLSX.utils.json_to_sheet(rows);
  const csv = XLSX.utils.sheet_to_csv(ws);
  const blob = new Blob([csv], { type: "text/csv;charset=utf-8;" });
  const url = URL.createObjectURL(blob);
  const a = document.createElement("a");
  a.href = url; a.download = filename; a.click();
  URL.revokeObjectURL(url);
}
