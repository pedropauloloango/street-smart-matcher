import type { OfficialBairro, OfficialParcelamento, SuggestContext } from "./suggest-local";
import { matchOfficialFromTexts, matchParcelamentoFromTexts, mergeSuggestions, sleep } from "./suggest-local";
import { normalizeCep } from "./cep";

const USER_AGENT = "BairroMatch/1.0 (street-smart-matcher; geo-bairros-cg)";

type NominatimItem = {
  display_name?: string;
  name?: string;
  address?: Record<string, string>;
};

type ViaCepResponse = {
  erro?: boolean;
  cep?: string;
  logradouro?: string;
  bairro?: string;
  localidade?: string;
  uf?: string;
};

function formatCepDisplay(cep8: string): string {
  return `${cep8.slice(0, 5)}-${cep8.slice(5)}`;
}

/** Consulta Correios/ViaCEP — retorna bairro (parcelamento) e logradouro. */
export async function fetchViaCep(cepRaw: string): Promise<ViaCepResponse | null> {
  const cep = normalizeCep(cepRaw);
  if (!cep) return null;

  const res = await fetch(`https://viacep.com.br/ws/${cep}/json/`, {
    headers: { Accept: "application/json", "User-Agent": USER_AGENT },
  });
  if (!res.ok) return null;

  const data = (await res.json()) as ViaCepResponse;
  if (data.erro || !data.bairro) return null;
  return data;
}

function extractNominatimTexts(data: NominatimItem[]): string[] {
  const texts: string[] = [];
  for (const item of data) {
    if (item.display_name) texts.push(item.display_name);
    if (item.name) texts.push(item.name);
    const addr = item.address ?? {};
    for (const key of ["suburb", "neighbourhood", "quarter", "city_district", "village", "town", "road"]) {
      if (addr[key]) texts.push(addr[key]);
    }
  }
  return texts;
}

export async function fetchNominatimTexts(informado: string, ctx?: SuggestContext): Promise<string[]> {
  const cep = ctx?.cep ? normalizeCep(ctx.cep) : null;
  const texts: string[] = [];

  if (cep) {
    const url = new URL("https://nominatim.openstreetmap.org/search");
    url.searchParams.set("postalcode", formatCepDisplay(cep));
    url.searchParams.set("city", "Campo Grande");
    url.searchParams.set("state", "Mato Grosso do Sul");
    url.searchParams.set("country", "Brasil");
    url.searchParams.set("format", "json");
    url.searchParams.set("limit", "5");
    url.searchParams.set("addressdetails", "1");

    const res = await fetch(url.toString(), {
      headers: { "User-Agent": USER_AGENT, Accept: "application/json" },
    });
    if (res.ok) {
      texts.push(...extractNominatimTexts((await res.json()) as NominatimItem[]));
    }
  }

  const parts: string[] = [];
  if (ctx?.logradouro?.trim()) parts.push(ctx.logradouro.trim());
  if (cep) parts.push(formatCepDisplay(cep));
  if (informado.trim()) parts.push(informado.trim());
  parts.push("Campo Grande", "Mato Grosso do Sul", "Brasil");

  const url = new URL("https://nominatim.openstreetmap.org/search");
  url.searchParams.set("q", parts.join(", "));
  url.searchParams.set("format", "json");
  url.searchParams.set("limit", "8");
  url.searchParams.set("countrycodes", "br");
  url.searchParams.set("addressdetails", "1");

  const res = await fetch(url.toString(), {
    headers: { "User-Agent": USER_AGENT, Accept: "application/json" },
  });
  if (res.ok) {
    texts.push(...extractNominatimTexts((await res.json()) as NominatimItem[]));
  }

  return [...new Set(texts)];
}

type WikiSearch = { query?: { search?: Array<{ title: string; snippet: string }> } };

export async function fetchWikipediaTexts(informado: string, ctx?: SuggestContext): Promise<string[]> {
  const cepPart = ctx?.cep && normalizeCep(ctx.cep) ? ` CEP ${formatCepDisplay(normalizeCep(ctx.cep)!)}` : "";
  const logPart = ctx?.logradouro?.trim() ? ` ${ctx.logradouro.trim()}` : "";
  const q = `${logPart}${cepPart} bairro Campo Grande Mato Grosso do Sul`.trim();
  const url = new URL("https://pt.wikipedia.org/w/api.php");
  url.searchParams.set("action", "query");
  url.searchParams.set("list", "search");
  url.searchParams.set("srsearch", q);
  url.searchParams.set("format", "json");
  url.searchParams.set("srlimit", "5");
  url.searchParams.set("origin", "*");

  const res = await fetch(url.toString(), { headers: { Accept: "application/json" } });
  if (!res.ok) return [];

  const data = (await res.json()) as WikiSearch;
  const texts: string[] = [];
  for (const hit of data.query?.search ?? []) {
    texts.push(hit.title);
    texts.push(hit.snippet.replace(/<[^>]+>/g, " "));
  }
  return texts;
}

export async function fetchDuckDuckGoTexts(informado: string, ctx?: SuggestContext): Promise<string[]> {
  const cep = ctx?.cep ? normalizeCep(ctx.cep) : null;
  const log = ctx?.logradouro?.trim() ?? "";
  const q = cep
    ? `CEP ${formatCepDisplay(cep)} ${log} Campo Grande MS bairro parcelamento`
    : `bairro ${informado} ${log} Campo Grande MS`;

  const body = new URLSearchParams({ q });
  const res = await fetch("https://html.duckduckgo.com/html/", {
    method: "POST",
    headers: {
      "User-Agent": USER_AGENT,
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: body.toString(),
  });
  if (!res.ok) return [];

  const html = await res.text();
  const texts: string[] = [];
  const snippetRe = /class="result__snippet"[^>]*>([\s\S]*?)<\/a>/gi;
  const titleRe = /class="result__a"[^>]*>([\s\S]*?)<\/a>/gi;
  let m: RegExpExecArray | null;
  while ((m = snippetRe.exec(html))) {
    texts.push(m[1].replace(/<[^>]+>/g, " ").trim());
  }
  while ((m = titleRe.exec(html))) {
    texts.push(m[1].replace(/<[^>]+>/g, " ").trim());
  }
  return texts;
}

export async function fetchWebSuggestionTexts(informado: string, ctx?: SuggestContext): Promise<{
  nominatim: string[];
  wikipedia: string[];
  duckduckgo: string[];
  viacep: string[];
}> {
  const viacepTexts: string[] = [];
  if (ctx?.cep) {
    const via = await fetchViaCep(ctx.cep).catch(() => null);
    if (via?.bairro) {
      viacepTexts.push(via.bairro);
      if (via.logradouro) viacepTexts.push(via.logradouro);
      viacepTexts.push(`${via.logradouro ?? ""}, ${via.bairro}, ${via.localidade ?? "Campo Grande"}`.trim());
    }
  }

  const [nominatim, wikipedia, duckduckgo] = await Promise.all([
    fetchNominatimTexts(informado, ctx).catch(() => [] as string[]),
    fetchWikipediaTexts(informado, ctx).catch(() => [] as string[]),
    fetchDuckDuckGoTexts(informado, ctx).catch(() => [] as string[]),
  ]);

  return { nominatim, wikipedia, duckduckgo, viacep: viacepTexts };
}

export async function buildWebSuggestions(
  informado: string,
  bairros: OfficialBairro[],
  ctx?: SuggestContext,
  parcelamentos: OfficialParcelamento[] = [],
) {
  const { nominatim, wikipedia, duckduckgo, viacep } = await fetchWebSuggestionTexts(informado, ctx);
  const allTexts = [...viacep, ...nominatim, ...wikipedia, ...duckduckgo];

  const viaCepMatches = viacep.length
    ? matchParcelamentoFromTexts(viacep, parcelamentos, "viacep")
    : [];

  return mergeSuggestions(
    viaCepMatches,
    matchParcelamentoFromTexts(allTexts, parcelamentos, "parcelamento"),
    matchOfficialFromTexts(nominatim, bairros, "nominatim"),
    matchOfficialFromTexts(wikipedia, bairros, "wikipedia"),
    matchOfficialFromTexts(duckduckgo, bairros, "web"),
  );
}

/** Respeita rate limit do Nominatim (1 req/s) em lotes. */
export async function buildWebSuggestionsBatched(
  informados: string[],
  bairros: OfficialBairro[],
  parcelamentos: OfficialParcelamento[] = [],
  onProgress?: (done: number, total: number) => void,
) {
  const out: Record<string, ReturnType<typeof matchOfficialFromTexts>> = {};
  for (let i = 0; i < informados.length; i++) {
    const informado = informados[i]!;
    out[informado] = await buildWebSuggestions(informado, bairros, undefined, parcelamentos);
    onProgress?.(i + 1, informados.length);
    if (i < informados.length - 1) await sleep(1100);
  }
  return out;
}
