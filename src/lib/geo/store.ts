// Store global do módulo GeoBairros CG (em memória, escopo da sessão)
import { useSyncExternalStore } from "react";
import type { Row } from "./io";

export type ResultRow = {
  linha: number;
  bairro_original: string;
  bairro_oficial: string | null;
  parcelamento: string | null;
  regiao_urbana: string | null;
  status_match: "encontrado" | "similaridade" | "nao_encontrado";
  percentual_confianca: number;
};

export type GeoState = {
  fileName: string | null;
  headers: string[];
  rows: Row[];
  bairroColumn: string | null;
  results: ResultRow[];
  importacaoId: string | null;
};

let state: GeoState = {
  fileName: null,
  headers: [],
  rows: [],
  bairroColumn: null,
  results: [],
  importacaoId: null,
};

const listeners = new Set<() => void>();

export const geoStore = {
  get: () => state,
  set: (patch: Partial<GeoState>) => {
    state = { ...state, ...patch };
    listeners.forEach((l) => l());
  },
  subscribe: (l: () => void) => {
    listeners.add(l);
    return () => listeners.delete(l);
  },
  reset: () => {
    state = { fileName: null, headers: [], rows: [], bairroColumn: null, results: [], importacaoId: null };
    listeners.forEach((l) => l());
  },
};

export function useGeoStore<T>(selector: (s: GeoState) => T): T {
  return useSyncExternalStore(geoStore.subscribe, () => selector(geoStore.get()), () => selector(geoStore.get()));
}
