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
};

export function stripAccents(s: string): string {
  return s.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
}

export function normalizeGeo(raw: unknown): string {
  if (raw == null) return "";
  let s = String(raw).trim();
  if (!s) return "";
  s = stripAccents(s).toUpperCase();
  s = s.replace(/[^\w\s./-]/g, " ").replace(/[._\-/]/g, " ");
  s = s.replace(/\s+/g, " ").trim();
  s = s.replace(/^(BAIRRO|B\.|B)\s+/, "");
  return s.split(" ").map((t) => ABBREV[t] ?? t).join(" ").replace(/\s+/g, " ").trim();
}

export function titleCase(s: string): string {
  return s.toLowerCase().replace(/(^|\s)([a-zà-ú])/g, (_, p, c) => p + c.toUpperCase());
}
