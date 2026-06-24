// Padronização de bairros: remoção de acentos, upper-case, expansão de abreviações.

const ABBREV: Record<string, string> = {
  JD: "JARDIM",
  "JD.": "JARDIM",
  VL: "VILA",
  "VL.": "VILA",
  PQ: "PARQUE",
  "PQ.": "PARQUE",
  RES: "RESIDENCIAL",
  "RES.": "RESIDENCIAL",
  CJ: "CONJUNTO",
  "CJ.": "CONJUNTO",
  CH: "CHACARA",
  "CH.": "CHACARA",
  STO: "SANTO",
  "STO.": "SANTO",
  STA: "SANTA",
  "STA.": "SANTA",
  S: "SAO", // S. JOAO -> SAO JOAO
  "S.": "SAO",
  N: "NOVO",
  "N.": "NOVO",
  PROF: "PROFESSOR",
  "PROF.": "PROFESSOR",
};

const STOP_PREFIX = /^(BAIRRO|B\.|B)\s+/;

export function stripAccents(input: string): string {
  return input.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
}

export function normalizeBairro(raw: unknown): string {
  if (raw == null) return "";
  let s = String(raw).trim();
  if (!s) return "";
  s = stripAccents(s).toUpperCase();
  s = s.replace(/[^\w\s./-]/g, " ").replace(/[._\-/]/g, " ");
  s = s.replace(/\s+/g, " ").trim();
  s = s.replace(STOP_PREFIX, "");

  const tokens = s.split(" ").map((t) => ABBREV[t] ?? t);
  return tokens.join(" ").replace(/\s+/g, " ").trim();
}
