export type BairroCep = {
  id: string;
  bairro_id: string;
  cep_inicio: string;
  cep_fim: string | null;
  logradouro: string | null;
};

/** Normaliza CEP para 8 dígitos (79074010). Aceita 5–8 dígitos. */
export function normalizeCep(raw: unknown): string | null {
  if (raw == null || raw === "") return null;
  const digits = String(raw).replace(/\D/g, "");
  if (digits.length < 5 || digits.length > 8) return null;
  return digits.padStart(8, "0");
}

/** Formata CEP para exibição (79074-010). */
export function formatCep(raw: unknown): string {
  const n = normalizeCep(raw);
  if (!n) return String(raw ?? "");
  return `${n.slice(0, 5)}-${n.slice(5)}`;
}

function cepToNumber(cep: string): number {
  return parseInt(cep.padEnd(8, "0"), 10);
}

export function cepMatchesEntry(cep8: string, entry: BairroCep): boolean {
  const start = entry.cep_inicio.replace(/\D/g, "");
  const end = entry.cep_fim?.replace(/\D/g, "") ?? null;
  if (!start) return false;

  if (end) {
    const n = cepToNumber(cep8);
    return n >= cepToNumber(start) && n <= cepToNumber(end);
  }

  if (start.length <= 5) return cep8.slice(0, 5) === start.padStart(5, "0").slice(0, 5);
  return cep8 === start.padEnd(8, "0").slice(0, 8);
}

export function findBairroIdsByCep(cepRaw: unknown, ceps: BairroCep[]): string[] {
  const cep = normalizeCep(cepRaw);
  if (!cep) return [];
  const ids = new Set<string>();
  for (const entry of ceps) {
    if (cepMatchesEntry(cep, entry)) ids.add(entry.bairro_id);
  }
  return [...ids];
}

export function buildCepsByBairro(ceps: BairroCep[]): Map<string, BairroCep[]> {
  const map = new Map<string, BairroCep[]>();
  for (const c of ceps) {
    const arr = map.get(c.bairro_id) ?? [];
    arr.push(c);
    map.set(c.bairro_id, arr);
  }
  return map;
}

export function cepBoostForBairro(bairroId: string, cepRaw: unknown, cepsByBairro: Map<string, BairroCep[]>): number {
  const cep = normalizeCep(cepRaw);
  if (!cep) return 0;
  const entries = cepsByBairro.get(bairroId) ?? [];
  for (const entry of entries) {
    if (cepMatchesEntry(cep, entry)) return 95;
  }
  return 0;
}
