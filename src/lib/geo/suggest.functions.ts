import { createServerFn } from "@tanstack/react-start";
import { z } from "zod";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";
import {
  getLocalSuggestions,
  mergeSuggestions,
  type BairroSuggestion,
  type OfficialBairro,
  type OfficialParcelamento,
  type SuggestContext,
} from "./suggest-local";
import { buildWebSuggestions } from "./suggest-web.server";
import { normalizeCep } from "./cep";

const bairroSchema = z.object({
  id: z.string().uuid(),
  bairro_oficial: z.string(),
  regiao_urbana: z.string().nullable(),
});

const parcSchema = z.object({
  id: z.string().uuid(),
  bairro_id: z.string().uuid(),
  parcelamento: z.string(),
  bairro_oficial: z.string(),
  regiao_urbana: z.string().nullable(),
});

const itemSchema = z
  .object({
    key: z.string().min(1),
    informado: z.string().trim(),
    cep: z.string().optional().nullable(),
    logradouro: z.string().optional().nullable(),
  })
  .refine(
    (item) =>
      item.informado.length > 0 ||
      !!(item.cep && normalizeCep(item.cep)) ||
      !!(item.logradouro && item.logradouro.trim()),
    { message: "Informe bairro, CEP ou logradouro para buscar sugestões." },
  );

const cepSchema = z.object({
  id: z.string().uuid(),
  bairro_id: z.string().uuid(),
  cep_inicio: z.string(),
  cep_fim: z.string().nullable(),
  logradouro: z.string().nullable(),
});

const schema = z.object({
  items: z.array(itemSchema).min(1).max(25),
  includeWeb: z.boolean().optional().default(true),
  bairros: z.array(bairroSchema).min(1),
  ceps: z.array(cepSchema).optional().default([]),
  parcelamentos: z.array(parcSchema).optional().default([]),
});

export type SuggestionsMap = Record<string, BairroSuggestion[]>;

export const fetchBairroSuggestions = createServerFn({ method: "POST" })
  .inputValidator(schema)
  .middleware([requireSupabaseAuth])
  .handler(async ({ data }) => {
    const list = data.bairros as OfficialBairro[];
    const parcs = data.parcelamentos as OfficialParcelamento[];
    const result: SuggestionsMap = {};

    for (let i = 0; i < data.items.length; i++) {
      const item = data.items[i]!;
      const ctx: SuggestContext = {
        cep: item.cep,
        logradouro: item.logradouro,
        ceps: data.ceps,
        parcelamentos: parcs,
      };

      const local = getLocalSuggestions(item.informado, list, ctx);
      let web: BairroSuggestion[] = [];

      if (data.includeWeb) {
        try {
          web = await buildWebSuggestions(item.informado, list, ctx, parcs);
        } catch (e) {
          console.error("[fetchBairroSuggestions] web failed for", item.informado, e);
        }
        if (i < data.items.length - 1) {
          await new Promise((r) => setTimeout(r, 1100));
        }
      }

      result[item.key] = mergeSuggestions(local, web);
    }

    return result;
  });
