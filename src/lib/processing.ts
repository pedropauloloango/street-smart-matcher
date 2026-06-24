import * as XLSX from "xlsx";
import Fuse from "fuse.js";
import { normalizeBairro } from "./normalize";

export type SisgranEntry = {
  bairro_normalizado: string;
  bairro_oficial: string;
  parcelamento: string | null;
  regiao_urbana: string | null;
};

export type ReceitaRow = Record<string, unknown>;

export type MatchedRow = ReceitaRow & {
  __bairro_input: string;
  __bairro_normalizado: string;
  __bairro_oficial: string | null;
  __parcelamento: string | null;
  __regiao_urbana: string | null;
  __score: number; // 0-100
  __matched: boolean;
};

export async function readSpreadsheet(file: File): Promise<Record<string, unknown>[]> {
  const buf = await file.arrayBuffer();
  const wb = XLSX.read(buf, { type: "array" });
  const sheet = wb.Sheets[wb.SheetNames[0]];
  return XLSX.utils.sheet_to_json<Record<string, unknown>>(sheet, { defval: "" });
}

// Tenta encontrar a coluna de bairro num registro, aceitando variações.
const BAIRRO_KEYS = ["bairro", "BAIRRO", "Bairro", "bairro_distrito", "Bairro/Distrito"];
const OFICIAL_KEYS = ["bairro_oficial", "BAIRRO_OFICIAL", "Bairro Oficial", "OFICIAL"];
const PARCEL_KEYS = ["parcelamento", "PARCELAMENTO", "Parcelamento"];
const REGIAO_KEYS = ["regiao_urbana", "REGIAO_URBANA", "Região Urbana", "Regiao Urbana", "REGIAO"];

function pick(row: Record<string, unknown>, candidates: string[]): string {
  for (const k of candidates) {
    if (row[k] != null && String(row[k]).trim() !== "") return String(row[k]);
  }
  // fallback: busca case-insensitive
  const lowerMap = Object.keys(row).reduce<Record<string, string>>((acc, k) => {
    acc[k.toLowerCase().trim()] = k;
    return acc;
  }, {});
  for (const k of candidates) {
    const real = lowerMap[k.toLowerCase().trim()];
    if (real && row[real] != null && String(row[real]).trim() !== "") return String(row[real]);
  }
  return "";
}

export function extractBairro(row: Record<string, unknown>): string {
  return pick(row, BAIRRO_KEYS);
}

export function sisgranFromRows(rows: Record<string, unknown>[]): SisgranEntry[] {
  const map = new Map<string, SisgranEntry>();
  for (const r of rows) {
    const bairroRaw = pick(r, [...OFICIAL_KEYS, ...BAIRRO_KEYS]);
    if (!bairroRaw) continue;
    const norm = normalizeBairro(bairroRaw);
    if (!norm) continue;
    if (map.has(norm)) continue;
    map.set(norm, {
      bairro_normalizado: norm,
      bairro_oficial: String(bairroRaw).trim(),
      parcelamento: pick(r, PARCEL_KEYS) || null,
      regiao_urbana: pick(r, REGIAO_KEYS) || null,
    });
  }
  return Array.from(map.values());
}

export type MatchOptions = {
  dictionary: SisgranEntry[]; // dicionário aprendido (Supabase)
  sisgran: SisgranEntry[]; // referência atual carregada
  threshold?: number; // score mínimo para aceitar match fuzzy (0-1, Fuse score)
  onProgress?: (done: number, total: number) => void;
};

export function matchRows(rows: ReceitaRow[], opts: MatchOptions): MatchedRow[] {
  const threshold = opts.threshold ?? 0.35;
  // Combina dicionário aprendido + referência SISGRAN. O dicionário vence empates.
  const refMap = new Map<string, SisgranEntry>();
  for (const e of opts.sisgran) refMap.set(e.bairro_normalizado, e);
  for (const e of opts.dictionary) refMap.set(e.bairro_normalizado, e); // sobrescreve
  const ref = Array.from(refMap.values());

  const fuse = new Fuse(ref, {
    keys: ["bairro_normalizado"],
    includeScore: true,
    threshold,
    ignoreLocation: true,
    minMatchCharLength: 3,
  });

  const out: MatchedRow[] = new Array(rows.length);
  const total = rows.length;
  for (let i = 0; i < total; i++) {
    const row = rows[i];
    const bairroInput = extractBairro(row);
    const norm = normalizeBairro(bairroInput);

    // 1) lookup exato no map combinado
    const exact = norm ? refMap.get(norm) : undefined;
    if (exact) {
      out[i] = {
        ...row,
        __bairro_input: bairroInput,
        __bairro_normalizado: norm,
        __bairro_oficial: exact.bairro_oficial,
        __parcelamento: exact.parcelamento,
        __regiao_urbana: exact.regiao_urbana,
        __score: 100,
        __matched: true,
      };
    } else if (!norm) {
      out[i] = {
        ...row,
        __bairro_input: bairroInput,
        __bairro_normalizado: "",
        __bairro_oficial: null,
        __parcelamento: null,
        __regiao_urbana: null,
        __score: 0,
        __matched: false,
      };
    } else {
      // 2) fuzzy
      const res = fuse.search(norm, { limit: 1 })[0];
      if (res && res.score != null) {
        const pct = Math.round((1 - res.score) * 100);
        out[i] = {
          ...row,
          __bairro_input: bairroInput,
          __bairro_normalizado: norm,
          __bairro_oficial: res.item.bairro_oficial,
          __parcelamento: res.item.parcelamento,
          __regiao_urbana: res.item.regiao_urbana,
          __score: pct,
          __matched: true,
        };
      } else {
        out[i] = {
          ...row,
          __bairro_input: bairroInput,
          __bairro_normalizado: norm,
          __bairro_oficial: null,
          __parcelamento: null,
          __regiao_urbana: null,
          __score: 0,
          __matched: false,
        };
      }
    }

    if (opts.onProgress && (i % 1000 === 0 || i === total - 1)) {
      opts.onProgress(i + 1, total);
    }
  }
  return out;
}

export function exportToXlsx(rows: MatchedRow[], filename = "resultado.xlsx") {
  const cleaned = rows.map((r) => {
    const { __bairro_input, __bairro_normalizado, __bairro_oficial, __parcelamento, __regiao_urbana, __score, __matched, ...rest } = r;
    return {
      ...rest,
      "Bairro (input)": __bairro_input,
      "Bairro Normalizado": __bairro_normalizado,
      "Bairro Oficial": __bairro_oficial ?? "",
      Parcelamento: __parcelamento ?? "",
      "Região Urbana": __regiao_urbana ?? "",
      "Score %": __score,
      Status: __matched ? "OK" : "NÃO ENCONTRADO",
    };
  });
  const ws = XLSX.utils.json_to_sheet(cleaned);
  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, "Resultado");
  XLSX.writeFile(wb, filename);
}

export function downloadReceitaTemplate() {
  const sample = [
    {
      "Tipo Logradouro": "RUA",
      Logradouro: "DAS PALMEIRAS",
      Numero: "123",
      Bairro: "JD DOS ESTADOS",
      CEP: "79020-000",
    },
    {
      "Tipo Logradouro": "AV",
      Logradouro: "AFONSO PENA",
      Numero: "4500",
      Bairro: "CENTRO",
      CEP: "79002-070",
    },
    {
      "Tipo Logradouro": "RUA",
      Logradouro: "EXEMPLO",
      Numero: "10",
      Bairro: "VL PROGRESSO",
      CEP: "79050-000",
    },
  ];
  const ws = XLSX.utils.json_to_sheet(sample);
  ws["!cols"] = [{ wch: 16 }, { wch: 28 }, { wch: 10 }, { wch: 28 }, { wch: 12 }];
  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, "Empresas");
  XLSX.writeFile(wb, "modelo_receita_federal.xlsx");
}

export function downloadSisgranTemplate() {
  const sample = [
    { "Bairro Oficial": "JARDIM DOS ESTADOS", Parcelamento: "JARDIM DOS ESTADOS", "Região Urbana": "CENTRO" },
    { "Bairro Oficial": "CENTRO", Parcelamento: "CENTRO", "Região Urbana": "CENTRO" },
    { "Bairro Oficial": "VILA PROGRESSO", Parcelamento: "PROGRESSO", "Região Urbana": "PROSPERIDADE" },
    { "Bairro Oficial": "PARQUE DOS PODERES", Parcelamento: "PARQUE DOS PODERES", "Região Urbana": "PROSPERIDADE" },
  ];
  const ws = XLSX.utils.json_to_sheet(sample);
  ws["!cols"] = [{ wch: 28 }, { wch: 28 }, { wch: 20 }];
  const wb = XLSX.utils.book_new();
  XLSX.utils.book_append_sheet(wb, ws, "SISGRAN");
  XLSX.writeFile(wb, "modelo_sisgran_campo_grande.xlsx");
}
