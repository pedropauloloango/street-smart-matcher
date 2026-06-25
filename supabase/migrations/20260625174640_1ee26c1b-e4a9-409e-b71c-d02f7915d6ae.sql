
-- ============ GEO BAIRROS CG ============

CREATE TABLE public.geo_bairros (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  bairro_oficial text NOT NULL UNIQUE,
  regiao_urbana text,
  ativo boolean NOT NULL DEFAULT true,
  data_cadastro timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.geo_bairros TO anon, authenticated;
GRANT ALL ON public.geo_bairros TO service_role;
ALTER TABLE public.geo_bairros ENABLE ROW LEVEL SECURITY;
CREATE POLICY "geo_bairros open select" ON public.geo_bairros FOR SELECT USING (true);
CREATE POLICY "geo_bairros open insert" ON public.geo_bairros FOR INSERT WITH CHECK (true);
CREATE POLICY "geo_bairros open update" ON public.geo_bairros FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "geo_bairros open delete" ON public.geo_bairros FOR DELETE USING (true);

CREATE TABLE public.geo_parcelamentos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  bairro_id uuid NOT NULL REFERENCES public.geo_bairros(id) ON DELETE CASCADE,
  parcelamento text NOT NULL,
  ativo boolean NOT NULL DEFAULT true,
  data_cadastro timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX geo_parcelamentos_bairro_idx ON public.geo_parcelamentos(bairro_id);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.geo_parcelamentos TO anon, authenticated;
GRANT ALL ON public.geo_parcelamentos TO service_role;
ALTER TABLE public.geo_parcelamentos ENABLE ROW LEVEL SECURITY;
CREATE POLICY "geo_parc open select" ON public.geo_parcelamentos FOR SELECT USING (true);
CREATE POLICY "geo_parc open insert" ON public.geo_parcelamentos FOR INSERT WITH CHECK (true);
CREATE POLICY "geo_parc open update" ON public.geo_parcelamentos FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "geo_parc open delete" ON public.geo_parcelamentos FOR DELETE USING (true);

CREATE TABLE public.geo_sinonimos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  bairro_id uuid NOT NULL REFERENCES public.geo_bairros(id) ON DELETE CASCADE,
  nome_informado text NOT NULL,
  nome_normalizado text NOT NULL,
  tipo_correspondencia text NOT NULL DEFAULT 'manual',
  confianca numeric NOT NULL DEFAULT 100,
  data_cadastro timestamptz NOT NULL DEFAULT now(),
  UNIQUE (nome_normalizado)
);
CREATE INDEX geo_sinonimos_bairro_idx ON public.geo_sinonimos(bairro_id);
CREATE INDEX geo_sinonimos_norm_idx ON public.geo_sinonimos(nome_normalizado);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.geo_sinonimos TO anon, authenticated;
GRANT ALL ON public.geo_sinonimos TO service_role;
ALTER TABLE public.geo_sinonimos ENABLE ROW LEVEL SECURITY;
CREATE POLICY "geo_sin open select" ON public.geo_sinonimos FOR SELECT USING (true);
CREATE POLICY "geo_sin open insert" ON public.geo_sinonimos FOR INSERT WITH CHECK (true);
CREATE POLICY "geo_sin open update" ON public.geo_sinonimos FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "geo_sin open delete" ON public.geo_sinonimos FOR DELETE USING (true);

CREATE TABLE public.geo_importacoes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome_arquivo text NOT NULL,
  usuario text,
  data_importacao timestamptz NOT NULL DEFAULT now(),
  total_registros integer NOT NULL DEFAULT 0,
  encontrados integer NOT NULL DEFAULT 0,
  similares integer NOT NULL DEFAULT 0,
  nao_encontrados integer NOT NULL DEFAULT 0,
  status text NOT NULL DEFAULT 'concluido'
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.geo_importacoes TO anon, authenticated;
GRANT ALL ON public.geo_importacoes TO service_role;
ALTER TABLE public.geo_importacoes ENABLE ROW LEVEL SECURITY;
CREATE POLICY "geo_imp open select" ON public.geo_importacoes FOR SELECT USING (true);
CREATE POLICY "geo_imp open insert" ON public.geo_importacoes FOR INSERT WITH CHECK (true);
CREATE POLICY "geo_imp open update" ON public.geo_importacoes FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "geo_imp open delete" ON public.geo_importacoes FOR DELETE USING (true);

CREATE TABLE public.geo_resultados (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  importacao_id uuid NOT NULL REFERENCES public.geo_importacoes(id) ON DELETE CASCADE,
  linha_original integer NOT NULL,
  bairro_original text,
  bairro_oficial text,
  parcelamento text,
  regiao_urbana text,
  status_match text NOT NULL DEFAULT 'nao_encontrado',
  percentual_confianca numeric NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX geo_resultados_imp_idx ON public.geo_resultados(importacao_id);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.geo_resultados TO anon, authenticated;
GRANT ALL ON public.geo_resultados TO service_role;
ALTER TABLE public.geo_resultados ENABLE ROW LEVEL SECURITY;
CREATE POLICY "geo_res open select" ON public.geo_resultados FOR SELECT USING (true);
CREATE POLICY "geo_res open insert" ON public.geo_resultados FOR INSERT WITH CHECK (true);
CREATE POLICY "geo_res open update" ON public.geo_resultados FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "geo_res open delete" ON public.geo_resultados FOR DELETE USING (true);
