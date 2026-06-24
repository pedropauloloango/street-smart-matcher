
-- Dicionário de bairros: serve como referência SISGRAN e aprende com correções manuais
CREATE TABLE public.bairros_dicionario (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  bairro_normalizado TEXT NOT NULL UNIQUE,
  bairro_oficial TEXT NOT NULL,
  parcelamento TEXT,
  regiao_urbana TEXT,
  origem TEXT NOT NULL DEFAULT 'sisgran', -- 'sisgran' | 'correcao'
  acertos INTEGER NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_bairros_dicionario_norm ON public.bairros_dicionario (bairro_normalizado);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.bairros_dicionario TO anon, authenticated;
GRANT ALL ON public.bairros_dicionario TO service_role;

ALTER TABLE public.bairros_dicionario ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Acesso aberto leitura dicionario" ON public.bairros_dicionario FOR SELECT USING (true);
CREATE POLICY "Acesso aberto insert dicionario" ON public.bairros_dicionario FOR INSERT WITH CHECK (true);
CREATE POLICY "Acesso aberto update dicionario" ON public.bairros_dicionario FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "Acesso aberto delete dicionario" ON public.bairros_dicionario FOR DELETE USING (true);

-- Histórico de processamentos
CREATE TABLE public.processamentos (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  nome_arquivo TEXT NOT NULL,
  total_registros INTEGER NOT NULL DEFAULT 0,
  matched INTEGER NOT NULL DEFAULT 0,
  unmatched INTEGER NOT NULL DEFAULT 0,
  percentual NUMERIC(5,2) NOT NULL DEFAULT 0,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE INDEX idx_processamentos_created ON public.processamentos (created_at DESC);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.processamentos TO anon, authenticated;
GRANT ALL ON public.processamentos TO service_role;

ALTER TABLE public.processamentos ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Acesso aberto leitura proc" ON public.processamentos FOR SELECT USING (true);
CREATE POLICY "Acesso aberto insert proc" ON public.processamentos FOR INSERT WITH CHECK (true);
CREATE POLICY "Acesso aberto update proc" ON public.processamentos FOR UPDATE USING (true) WITH CHECK (true);
CREATE POLICY "Acesso aberto delete proc" ON public.processamentos FOR DELETE USING (true);

-- Trigger updated_at
CREATE OR REPLACE FUNCTION public.touch_updated_at()
RETURNS TRIGGER AS $$
BEGIN NEW.updated_at = now(); RETURN NEW; END;
$$ LANGUAGE plpgsql SET search_path = public;

CREATE TRIGGER trg_bairros_dicionario_touch
BEFORE UPDATE ON public.bairros_dicionario
FOR EACH ROW EXECUTE FUNCTION public.touch_updated_at();
