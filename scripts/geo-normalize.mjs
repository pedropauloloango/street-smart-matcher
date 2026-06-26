/** Normalização compartilhada para scripts GeoBairros CG (espelha src/lib/geo/normalize.ts). */

const ABBREV = {
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

const ROMAN_SUFFIX =
  /^(I{1,3}|IV|VI{0,3}|IX|X{1,3}|XI{0,3}|XIV|XVI{0,3}|XIX|XX|XXI{0,3}|XXIV|XXV)$/;

const TRAILING_NOISE = new Set(["PARTE", "FRACAO", "FRENTE", "FUNDOS"]);

function isRomanSuffix(token) {
  return ROMAN_SUFFIX.test(token);
}

function isNumericSuffix(token) {
  return /^\d{1,2}$/.test(token);
}

export function stripBairroSuffixes(normalized) {
  let tokens = normalized.split(/\s+/).filter(Boolean);
  if (tokens.length <= 1) return normalized;

  let changed = true;
  while (changed && tokens.length > 1) {
    changed = false;
    const last = tokens[tokens.length - 1];
    const prev = tokens[tokens.length - 2];

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

  while (tokens.length > 1 && TRAILING_NOISE.has(tokens[tokens.length - 1])) {
    tokens = tokens.slice(0, -1);
  }

  return tokens.join(" ").trim();
}

export function normalizeGeo(raw) {
  if (raw == null) return "";
  let s = String(raw).trim();
  if (!s) return "";
  s = s.normalize("NFD").replace(/[\u0300-\u036f]/g, "").toUpperCase();
  s = s.replace(/\([^)]*\)/g, " ");
  s = s.replace(/[^\w\s./-]/g, " ").replace(/[._\-/]/g, " ");
  s = s.replace(/\s+/g, " ").trim();
  s = s.replace(/^(BAIRRO|B\.|B)\s+/, "");
  s = s.split(" ").map((t) => ABBREV[t] ?? t).join(" ").replace(/\s+/g, " ").trim();
  return stripBairroSuffixes(s);
}
