-- CEP/logradouro na base oficial e nos resultados importados (idempotente)

CREATE TABLE IF NOT EXISTS public.geo_bairro_ceps (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  bairro_id uuid NOT NULL REFERENCES public.geo_bairros(id) ON DELETE CASCADE,
  cep_inicio text NOT NULL,
  cep_fim text,
  logradouro text,
  ativo boolean NOT NULL DEFAULT true,
  data_cadastro timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX IF NOT EXISTS geo_bairro_ceps_bairro_idx ON public.geo_bairro_ceps(bairro_id);
CREATE INDEX IF NOT EXISTS geo_bairro_ceps_inicio_idx ON public.geo_bairro_ceps(cep_inicio);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.geo_bairro_ceps TO anon, authenticated;
GRANT ALL ON public.geo_bairro_ceps TO service_role;
ALTER TABLE public.geo_bairro_ceps ENABLE ROW LEVEL SECURITY;

DO $$ BEGIN
  CREATE POLICY "geo_cep open select" ON public.geo_bairro_ceps FOR SELECT USING (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE POLICY "geo_cep open insert" ON public.geo_bairro_ceps FOR INSERT WITH CHECK (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE POLICY "geo_cep open update" ON public.geo_bairro_ceps FOR UPDATE USING (true) WITH CHECK (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

DO $$ BEGIN
  CREATE POLICY "geo_cep open delete" ON public.geo_bairro_ceps FOR DELETE USING (true);
EXCEPTION WHEN duplicate_object THEN NULL;
END $$;

ALTER TABLE public.geo_resultados
  ADD COLUMN IF NOT EXISTS logradouro text,
  ADD COLUMN IF NOT EXISTS cep text;

-- Faixas/prefixos CEP principais de Campo Grande-MS (refináveis na Base Oficial)
INSERT INTO public.geo_bairro_ceps (bairro_id, cep_inicio, cep_fim, logradouro)
SELECT b.id, v.cep_inicio, v.cep_fim, v.logradouro
FROM (VALUES
  ('Centro', '79002000', '79004999', 'Rua 13 de Junho'),
  ('Amambaí', '79005000', '79006999', 'Rua Bahia'),
  ('Amambai', '79005000', '79006999', 'Rua Bahia'),
  ('Cruzeiro', '79006000', '79006999', 'Rua 14 de Julho'),
  ('Glória', '79004000', '79004999', 'Rua Barão do Rio Branco'),
  ('Planalto', '79009000', '79009999', 'Rua Bahia'),
  ('Monte Líbano', '79010000', '79010999', 'Rua Antônio Maria Coelho'),
  ('Jardim dos Estados', '79020000', '79020999', 'Rua Pedro Celestino'),
  ('São Francisco', '79007000', '79007999', 'Rua Antônio Maria Coelho'),
  ('Cabreúva', '79008000', '79008999', 'Rua Mato Grosso'),
  ('Santa Fé (Parte Centro)', '79021000', '79021999', 'Rua Santa Fé'),
  ('Moreninha', '79070000', '79077999', 'Av. Moreninha'),
  ('Universitário', '79070000', '79070999', 'Rua Antônio Maria Coelho'),
  ('Los Angeles', '79073000', '79073999', 'Rua Campo Nobre'),
  ('Centenário', '79074000', '79074999', 'Rua Centenário'),
  ('Pioneiros', '79075000', '79075999', 'Rua Pioneiros'),
  ('Taquarussu', '79076000', '79076999', 'Rua Taquarussu'),
  ('Rita Vieira', '79052000', '79052999', 'Rua Parque Dallas'),
  ('Tiradentes', '79041000', '79041999', 'Rua Assaf Trad'),
  ('Coophavila II', '79052000', '79052999', 'Rua Coophavila'),
  ('Leblon', '79052000', '79052999', 'Rua Leblon'),
  ('Guanandi', '79086000', '79086999', 'Rua Miramontes'),
  ('Autonomista', '79086000', '79086999', 'Rua Autonomista'),
  ('Carandá', '79091000', '79091999', 'Rua Carandá'),
  ('Noroeste', '79085000', '79085999', 'Rua Noroeste'),
  ('Chácara Cachoeira', '79096000', '79096999', 'Rua Brilhante'),
  ('Chácara dos Poderes', '79005000', '79005999', 'Av. Afonso Pena'),
  ('Seminário', '79093000', '79093999', 'Rua Tamandaré'),
  ('Nova Lima', '79096000', '79096999', 'Rua Tarsila do Amaral'),
  ('Nasser', '79088000', '79088999', 'Rua Siriema'),
  ('Nasser', '79117000', '79117999', 'Rua Carlos Scardine'),
  ('Taveirópolis', '79096000', '79096999', 'Rua Bela Vista'),
  ('Tarumã', '79097000', '79097999', 'Rua Tarumã'),
  ('Aero Rancho', '79084000', '79084999', 'Rua Dona Júlia'),
  ('Estrela Dalva', '79094000', '79094999', 'Rua Estrela Dalva'),
  ('Veraneio', '79095000', '79095999', 'Rua Veraneio'),
  ('Coronel Antonino', '79098000', '79098999', 'Rua Coronel Antonino'),
  ('Nova Campo Grande', '79065000', '79065999', 'Rua Nova Campo Grande'),
  ('Sobrinho', '79066000', '79066999', 'Rua Sobrinho'),
  ('Bandeirantes', '79080000', '79080999', 'Rua Bandeirantes'),
  ('Batistão', '79081000', '79081999', 'Rua Batistão'),
  ('Caiobá', '79082000', '79082999', 'Rua Caiobá'),
  ('São Conrado', '79083000', '79083999', 'Rua São Conrado'),
  ('Tijuca', '79087000', '79087999', 'Rua Tijuca'),
  ('União', '79089000', '79089999', 'Rua União'),
  ('Margarida', '79092000', '79092999', 'Rua Margarida'),
  ('Mata do Jacinto', '79090000', '79090999', 'Rua Mata do Jacinto'),
  ('Novos Estados', '79078000', '79078999', 'Rua Novos Estados'),
  ('Santa Fé', '79079000', '79079999', 'Rua Santa Fé'),
  ('Alves Pereira', '79071000', '79071999', 'Rua Alves Pereira'),
  ('Centro Oeste', '79072000', '79072999', 'Rua Centro Oeste'),
  ('Jacy', '79073000', '79073999', 'Rua Jacy'),
  ('Parati', '79074000', '79074999', 'Rua Parati'),
  ('Piratininga', '79075000', '79075999', 'Rua Piratininga'),
  ('Carlota', '79050000', '79050999', 'Rua Carlota'),
  ('Dr. Albuquerque', '79051000', '79051999', 'Rua Dr. Albuquerque'),
  ('Maria Aparecida Pedrossian', '79053000', '79053999', 'Rua Maria Aparecida Pedrossian'),
  ('São Lourenço', '79054000', '79054999', 'Rua São Lourenço'),
  ('Tv Morena', '79055000', '79055999', 'Rua Tv Morena'),
  ('Vilasboas', '79056000', '79056999', 'Rua Vilasboas'),
  ('Itanhangá', '79057000', '79057999', 'Rua Itanhangá'),
  ('Itanhangá (Parte Sul)', '79057000', '79057999', 'Rua Itanhangá'),
  ('Panamá', '79067000', '79067999', 'Rua Panamá'),
  ('Popular', '79068000', '79068999', 'Rua Popular'),
  ('Santo Amaro', '79069000', '79069999', 'Rua Santo Amaro'),
  ('Santo Antônio', '79060000', '79060999', 'Rua Santo Antônio'),
  ('Núcleo Industrial', '79061000', '79061999', 'Rua Núcleo Industrial'),
  ('José Abrão', '79099000', '79099999', 'Rua José Abrão'),
  ('Mata do Segredo', '79100000', '79100999', 'Rua Mata do Segredo'),
  ('Monte Castelo', '79101000', '79101999', 'Rua Monte Castelo')
) AS v(bairro_oficial, cep_inicio, cep_fim, logradouro)
JOIN public.geo_bairros b ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
WHERE NOT EXISTS (
  SELECT 1 FROM public.geo_bairro_ceps c
  WHERE c.bairro_id = b.id AND c.cep_inicio = v.cep_inicio AND c.ativo = true
);
