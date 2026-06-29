// Planilha modelo para importação GeoBairros CG
import { exportCSV, exportXLSX, type Row } from "./io";

/** Exemplos com grafias variadas para testar exato, sinônimo, similaridade e não encontrado. */
export const IMPORT_TEMPLATE_ROWS: Row[] = [
  { Linha: 1, BAIRRO: "JD AMAMBAI", LOGRADOURO: "Rua Bahia, 1200", CEP: "79005-120" },
  { Linha: 2, BAIRRO: "vila amambai", LOGRADOURO: "Av. Afonso Pena, 500", CEP: "79005-010" },
  { Linha: 3, BAIRRO: "AMAMBAÍ", LOGRADOURO: "Rua 14 de Julho, 88", CEP: "79006-001" },
  { Linha: 4, BAIRRO: "JARDIM UNIVERSITÁRIO", LOGRADOURO: "Rua Antônio Maria Coelho, 3000", CEP: "79070-010" },
  { Linha: 5, BAIRRO: "COHAB UNIVERSITARIA", LOGRADOURO: "Rua Ceará, 450", CEP: "79070-200" },
  { Linha: 6, BAIRRO: "MORENINHA II", LOGRADOURO: "Rua José Maksoud, 200", CEP: "79070-500" },
  { Linha: 7, BAIRRO: "moreninha 3", LOGRADOURO: "Av. Moreninha, 1500", CEP: "79077-010" },
  { Linha: 8, BAIRRO: "CHACARA CACHOEIRA", LOGRADOURO: "Rua Brilhante, 900", CEP: "79096-100" },
  { Linha: 9, BAIRRO: "VILA NASSER", LOGRADOURO: "Rua Siriema, 77", CEP: "79088-010" },
  { Linha: 10, BAIRRO: "GUANANDI", LOGRADOURO: "Rua Miramontes, 220", CEP: "79086-010" },
  { Linha: 11, BAIRRO: "JD LOS ANGELES", LOGRADOURO: "Rua Campo Nobre, 60", CEP: "79073-010" },
  { Linha: 12, BAIRRO: "JARDIM TIRADENTES", LOGRADOURO: "Rua Assaf Trad, 410", CEP: "79041-010" },
  { Linha: 13, BAIRRO: "RITA VIEIRA", LOGRADOURO: "Rua Parque Dallas, 33", CEP: "79052-010" },
  { Linha: 14, BAIRRO: "CENTRO", LOGRADOURO: "Rua 13 de Junho, 100", CEP: "79002-010" },
  { Linha: 15, BAIRRO: "VL PLANALTO", LOGRADOURO: "Rua Bahia, 3800", CEP: "79009-010" },
  { Linha: 16, BAIRRO: "JD DOS ESTADOS", LOGRADOURO: "Rua Pedro Celestino, 200", CEP: "79020-010" },
  { Linha: 17, BAIRRO: "NOVA LIMA", LOGRADOURO: "Rua Tarsila do Amaral, 50", CEP: "79096-200" },
  { Linha: 18, BAIRRO: "SEMINARIO", LOGRADOURO: "Rua Tamandaré, 180", CEP: "79093-010" },
  { Linha: 19, BAIRRO: "TAVEIROPOLIS", LOGRADOURO: "Rua Bela Vista, 12", CEP: "79096-300" },
  { Linha: 20, BAIRRO: "RES DAMHA I", LOGRADOURO: "Rua Oiti, 700", CEP: "79084-010" },
  { Linha: 21, BAIRRO: "AERO RANCHO I", LOGRADOURO: "Rua Dona Júlia, 90", CEP: "79084-100" },
  { Linha: 22, BAIRRO: "AERO RANCHO SETOR VI", LOGRADOURO: "Rua Marambaia, 44", CEP: "79084-200" },
  { Linha: 23, BAIRRO: "MORENINHA III", LOGRADOURO: "Av. Moreninha, 800", CEP: "79077-100" },
  { Linha: 24, BAIRRO: "BAIRRO INEXISTENTE XYZ", LOGRADOURO: "Rua Teste, 1", CEP: "79002-999" },
  { Linha: 25, BAIRRO: "JD VENEZA", LOGRADOURO: "Rua Exemplo, 999", CEP: "79070-999" },
];

const BASE_NAME = "geobairros-modelo-importacao";

export function downloadImportTemplate(format: "xlsx" | "csv") {
  if (format === "xlsx") exportXLSX(IMPORT_TEMPLATE_ROWS, `${BASE_NAME}.xlsx`);
  else exportCSV(IMPORT_TEMPLATE_ROWS, `${BASE_NAME}.csv`);
}
