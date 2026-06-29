// GeoBairros CG — normalização de bairros (isolada do módulo principal)

const ABBREV: Record<string, string> = {
  JD: "JARDIM", "JD.": "JARDIM",
  VL: "VILA", "VL.": "VILA",
  PQ: "PARQUE", "PQ.": "PARQUE",
  RES: "RESIDENCIAL", "RES.": "RESIDENCIAL",
  CJ: "CONJUNTO", "CJ.": "CONJUNTO",
  CH: "CHACARA", "CH.": "CHACARA",
  STO: "SANTO", "STO.": "SANTO",
  STA: "SANTA", "STA.": "SANTA",
  "S.": "SAO", "N.": "NOVO",
  PROF: "PROFESSOR", "PROF.": "PROFESSOR",
  CONJ: "CONJUNTO",
  HAB: "HABITACIONAL",
  LT: "LOTEAMENTO",
  LOT: "LOTEAMENTO",
  LOTE: "LOTEAMENTO",
  COND: "CONDOMINIO",
  PORT: "PORTAL",
};

const TRAILING_NOISE = new Set(["PARTE", "FRACAO", "FRENTE", "FUNDOS"]);

/** Algarismos romanos usados como sufixo de setor/quadra (I … XXV). */
const ROMAN_SUFFIX =
  /^(I{1,3}|IV|VI{0,3}|IX|X{1,3}|XI{0,3}|XIV|XVI{0,3}|XIX|XX|XXI{0,3}|XXIV|XXV)$/;

function isRomanSuffix(token: string): boolean {
  return ROMAN_SUFFIX.test(token);
}

function isNumericSuffix(token: string): boolean {
  return /^\d{1,2}$/.test(token);
}

/** Remove sufixos de setor/ordem para matching ao bairro oficial (ex.: AERO RANCHO II → AERO RANCHO). */
export function stripBairroSuffixes(normalized: string): string {
  let tokens = normalized.split(/\s+/).filter(Boolean);
  if (tokens.length <= 1) return normalized;

  let changed = true;
  while (changed && tokens.length > 1) {
    changed = false;
    const last = tokens[tokens.length - 1]!;
    const prev = tokens[tokens.length - 2]!;

    if (prev === "SETOR" && (isRomanSuffix(last) || isNumericSuffix(last))) {
      tokens = tokens.slice(0, -2);
      changed = true;
      continue;
    }

    if (isRomanSuffix(last) || isNumericSuffix(last)) {
      tokens = tokens.slice(0, -1);
      changed = true;
    }
  }

  while (tokens.length > 1 && TRAILING_NOISE.has(tokens[tokens.length - 1]!)) {
    tokens = tokens.slice(0, -1);
  }

  return tokens.join(" ").trim();
}

/** Remove trecho " - SEÇÃO …" do parcelamento para matching (ex.: Universitário - Seção D → Universitário). */
export function stripSecaoParcelamento(raw: unknown): string {
  const s = String(raw ?? "").trim();
  if (!s) return s;
  const parts = s.split(/\s*-\s*/);
  const out: string[] = [];
  for (const p of parts) {
    if (/se[cç][aã]o/i.test(p)) break;
    if (/^\d+\s*[ªº]?\s*se[cç][aã]o/i.test(p)) break;
    if (/^parte$/i.test(p.trim())) break;
    out.push(p.trim());
  }
  const joined = out.join(" - ").trim();
  return joined || s;
}

export function stripAccents(s: string): string {
  return s.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
}

export function normalizeGeo(raw: unknown): string {
  if (raw == null) return "";
  let s = String(raw).trim();
  if (!s) return "";
  s = stripAccents(s).toUpperCase();
  s = s.replace(/\([^)]*\)/g, " ");
  s = s.replace(/[^\w\s./-]/g, " ").replace(/[._\-/]/g, " ");
  s = s.replace(/\s+/g, " ").trim();
  s = s.replace(/^(BAIRRO|B\.|B)\s+/, "");
  s = s.split(" ").map((t) => ABBREV[t] ?? t).join(" ").replace(/\s+/g, " ").trim();
  return stripBairroSuffixes(s);
}

export function titleCase(s: string): string {
  return s.toLowerCase().replace(/(^|\s)([a-zà-ú])/g, (_, p, c) => p + c.toUpperCase());
}
