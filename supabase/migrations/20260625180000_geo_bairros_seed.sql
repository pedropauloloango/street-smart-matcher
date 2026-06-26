
-- Seed inicial: bairros oficiais de Campo Grande-MS (amostra representativa)
-- Preparado para expansão futura com a base completa do município.

INSERT INTO public.geo_bairros (bairro_oficial, regiao_urbana) VALUES
  ('Amambaí', 'Centro'),
  ('Bandeira', 'Centro'),
  ('Bela Vista', 'Centro'),
  ('Centro', 'Centro'),
  ('Cruzeiro', 'Centro'),
  ('Rita Vieira', 'Centro'),
  ('Tiradentes', 'Centro'),
  ('Chácara Cachoeira', 'Leste'),
  ('Guanandi', 'Leste'),
  ('Vila Nasser', 'Leste'),
  ('Cabreúva', 'Leste'),
  ('Coophavila', 'Norte'),
  ('Jardim Leblon', 'Norte'),
  ('Monte Castelo', 'Norte'),
  ('Jardim dos Estados', 'Sul'),
  ('Moreninha', 'Sul'),
  ('Santa Fé', 'Sul'),
  ('Jardim Veneza', 'Oeste'),
  ('Jardim Seminário', 'Oeste'),
  ('Nova Lima', 'Oeste')
ON CONFLICT (bairro_oficial) DO NOTHING;

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Amambaí'), ('Vila Amambaí')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Amambaí'
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Veneza I'), ('Jardim Veneza II')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Jardim Veneza'
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento
  );

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sinonimo', 100
FROM public.geo_bairros b
CROSS JOIN (VALUES
  ('AMAMBAI', 'AMAMBAI'),
  ('AMAMBAÍ', 'AMAMBAI'),
  ('VILA AMAMBAI', 'VILA AMAMBAI'),
  ('JD AMAMBAI', 'JARDIM AMAMBAI'),
  ('JARDIM AMAMBAI', 'JARDIM AMAMBAI')
) AS v(nome_informado, nome_normalizado)
WHERE b.bairro_oficial = 'Amambaí'
ON CONFLICT (nome_normalizado) DO NOTHING;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sinonimo', 100
FROM public.geo_bairros b
CROSS JOIN (VALUES
  ('JD VENEZA', 'JARDIM VENEZA'),
  ('JARDIM VENEZA', 'JARDIM VENEZA')
) AS v(nome_informado, nome_normalizado)
WHERE b.bairro_oficial = 'Jardim Veneza'
ON CONFLICT (nome_normalizado) DO NOTHING;
