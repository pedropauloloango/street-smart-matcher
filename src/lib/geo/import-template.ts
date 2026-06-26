// Planilha modelo para importação GeoBairros CG
import { exportCSV, exportXLSX, type Row } from "./io";

/** Exemplos com grafias variadas para testar exato, sinônimo, similaridade e não encontrado. */
export const IMPORT_TEMPLATE_ROWS: Row[] = [
  { Linha: 1, BAIRRO: "JD AMAMBAI", ENDERECO: "Rua Bahia, 1200" },
  { Linha: 2, BAIRRO: "vila amambai", ENDERECO: "Av. Afonso Pena, 500" },
  { Linha: 3, BAIRRO: "AMAMBAÍ", ENDERECO: "Rua 14 de Julho, 88" },
  { Linha: 4, BAIRRO: "JARDIM UNIVERSITÁRIO", ENDERECO: "Rua Antônio Maria Coelho, 3000" },
  { Linha: 5, BAIRRO: "COHAB UNIVERSITARIA", ENDERECO: "Rua Ceará, 450" },
  { Linha: 6, BAIRRO: "MORENINHA II", ENDERECO: "Rua José Maksoud, 200" },
  { Linha: 7, BAIRRO: "moreninha 3", ENDERECO: "Av. Moreninha, 1500" },
  { Linha: 8, BAIRRO: "CHACARA CACHOEIRA", ENDERECO: "Rua Brilhante, 900" },
  { Linha: 9, BAIRRO: "VILA NASSER", ENDERECO: "Rua Siriema, 77" },
  { Linha: 10, BAIRRO: "GUANANDI", ENDERECO: "Rua Miramontes, 220" },
  { Linha: 11, BAIRRO: "JD LOS ANGELES", ENDERECO: "Rua Campo Nobre, 60" },
  { Linha: 12, BAIRRO: "JARDIM TIRADENTES", ENDERECO: "Rua Assaf Trad, 410" },
  { Linha: 13, BAIRRO: "RITA VIEIRA", ENDERECO: "Rua Parque Dallas, 33" },
  { Linha: 14, BAIRRO: "CENTRO", ENDERECO: "Rua 13 de Junho, 100" },
  { Linha: 15, BAIRRO: "VL PLANALTO", ENDERECO: "Rua Bahia, 3800" },
  { Linha: 16, BAIRRO: "JD DOS ESTADOS", ENDERECO: "Rua Pedro Celestino, 200" },
  { Linha: 17, BAIRRO: "NOVA LIMA", ENDERECO: "Rua Tarsila do Amaral, 50" },
  { Linha: 18, BAIRRO: "SEMINARIO", ENDERECO: "Rua Tamandaré, 180" },
  { Linha: 19, BAIRRO: "TAVEIROPOLIS", ENDERECO: "Rua Bela Vista, 12" },
  { Linha: 20, BAIRRO: "RES DAMHA I", ENDERECO: "Rua Oiti, 700" },
  { Linha: 21, BAIRRO: "AERO RANCHO I", ENDERECO: "Rua Dona Júlia, 90" },
  { Linha: 22, BAIRRO: "AERO RANCHO SETOR VI", ENDERECO: "Rua Marambaia, 44" },
  { Linha: 23, BAIRRO: "MORENINHA III", ENDERECO: "Av. Moreninha, 800" },
  { Linha: 24, BAIRRO: "BAIRRO INEXISTENTE XYZ", ENDERECO: "Rua Teste, 1" },
  { Linha: 25, BAIRRO: "JD VENEZA", ENDERECO: "Rua Exemplo, 999" },
];

const BASE_NAME = "geobairros-modelo-importacao";

export function downloadImportTemplate(format: "xlsx" | "csv") {
  if (format === "xlsx") exportXLSX(IMPORT_TEMPLATE_ROWS, `${BASE_NAME}.xlsx`);
  else exportCSV(IMPORT_TEMPLATE_ROWS, `${BASE_NAME}.csv`);
}
