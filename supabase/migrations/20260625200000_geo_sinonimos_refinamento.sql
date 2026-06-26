-- Refinamento de sinônimos GeoBairros CG — Campo Grande-MS
-- Grafias comuns, abreviações e empreendimentos (Planurb/SISGRAN + cadastro municipal)
-- Gerado por scripts/generate-geo-sinonimos-refinement.mjs

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Aero Rancho', 'AERO RANCHO', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'conj Habitacional Aero Rancho', 'CONJUNTO HABITACIONAL AERO RANCHO', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cohab Aero Rancho', 'COHAB AERO RANCHO', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'CH Aero Rancho', 'CHACARA AERO RANCHO', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Habitacional Aero Rancho', 'HABITACIONAL AERO RANCHO', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Dona Júlia', 'DONA JULIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Ana Maria', 'VILA ANA MARIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Ana Maria', 'ANA MARIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim das Hortênsias', 'JARDIM DAS HORTENSIAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'das Hortênsias', 'DAS HORTENSIAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque do Sol', 'PARQUE DO SOL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'do Sol', 'DO SOL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Alves Pereira', 'ALVES PEREIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Alves Pereira', 'JARDIM ALVES PEREIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Maria', 'SANTA MARIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Novo Século', 'VILA NOVO SECULO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Novo Século', 'NOVO SECULO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Morente', 'JARDIM MORENTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Morente', 'MORENTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Betaville', 'RESIDENCIAL BETAVILLE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Betaville', 'BETAVILLE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Centenário (parte)', 'CENTENARIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Leblon' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Centenário (parte)', 'JARDIM CENTENARIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Leblon' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Iracy Coelho (I, II e III)', 'IRACY COELHO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centenário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque Lageado', 'PARQUE LAGEADO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centenário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Lageado', 'LAGEADO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centenário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Santa Emília (parte)', 'JARDIM SANTA EMILIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centenário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Emília', 'SANTA EMILIA', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Conrado' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Centro Oeste', 'CENTRO OESTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Centro Oeste', 'JARDIM CENTRO OESTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Colorado', 'JARDIM COLORADO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Colorado', 'COLORADO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Macaúbas', 'JARDIM MACAUBAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Macaúbas', 'MACAUBAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque Novo Século', 'PARQUE NOVO SECULO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Canguru', 'JARDIM CANGURU', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Canguru', 'CANGURU', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Marajoara', 'MARAJOARA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jacy (parte)', 'JACY', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Jacy (parte)', 'VILA JACY', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Paulista', 'JARDIM PAULISTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Paulista', 'PAULISTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'IPÊ', 'IPE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Paraíso', 'VILA PARAISO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Paraíso', 'PARAISO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Progresso (parte)', 'VILA PROGRESSO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Progresso (parte)', 'PROGRESSO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Los Angeles', 'LOS ANGELES', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Los Angeles', 'JARDIM LOS ANGELES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Uirapuru', 'JARDIM UIRAPURU', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Uirapuru', 'UIRAPURU', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vegas', 'VEGAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Campo Nobre', 'JARDIM CAMPO NOBRE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Campo Nobre', 'CAMPO NOBRE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Morada do Sol', 'MORADA DO SOL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parati (fração)', 'PARATI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Segredo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Parati', 'JARDIM PARATI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Monte Alegre', 'JARDIM MONTE ALEGRE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Monte Alegre', 'MONTE ALEGRE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Piratininga', 'PIRATININGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Anápolis', 'JARDIM ANAPOLIS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Anápolis', 'ANAPOLIS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Spalding', 'RESIDENCIAL SPALDING', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Spalding', 'SPALDING', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Pioneiros', 'PIONEIROS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Pioneiros', 'VILA PIONEIROS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Botafogo', 'JARDIM BOTAFOGO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Botafogo', 'BOTAFOGO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Adelina', 'VILA ADELINA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Adelina', 'ADELINA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Joana D''Arc', 'JOANA D ARC', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Divisória', 'VILA DIVISORIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Divisória', 'DIVISORIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Piratininga', 'VILA PIRATININGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Nhanhá', 'JARDIM NHANHA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nhanhá', 'NHANHA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Promorar', 'PROMORAR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Ipiranga', 'VILA IPIRANGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Ipiranga', 'IPIRANGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Núcleo Piratininga', 'NUCLEO PIRATININGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Getúlia Barbosa', 'VILA GETULIA BARBOSA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Getúlia Barbosa', 'GETULIA BARBOSA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Taquarussu', 'TAQUARUSSU', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Taquarussu', 'VILA TAQUARUSSU', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Carvalho (parte)', 'VILA CARVALHO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Carvalho (parte)', 'CARVALHO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Jacy (parte)', 'JARDIM JACY', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Belo Horizonte', 'VILA BELO HORIZONTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Belo Horizonte', 'BELO HORIZONTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Universitário', 'UNIVERSITARIO', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'jd Universitário', 'JARDIM UNIVERSITARIO', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Olinda', 'VILA OLINDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Olinda', 'OLINDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Dynamic', 'JARDIM DYNAMIC', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Dynamic', 'DYNAMIC', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'COHAB UNIVERSITARIA', 'COHAB UNIVERSITARIA', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Continental', 'JARDIM CONTINENTAL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Continental', 'CONTINENTAL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Maciel', 'VILA MACIEL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Maciel', 'MACIEL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Carlota', 'CARLOTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Carlota', 'JARDIM CARLOTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Albuquerque (parte)', 'VILA ALBUQUERQUE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Albuquerque (parte)', 'ALBUQUERQUE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Its', 'JARDIM ITS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Its', 'ITS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santos Dumont', 'VILA SANTOS DUMONT', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santos Dumont', 'SANTOS DUMONT', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Mansur', 'MANSUR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Dr. Albuquerque', 'DR ALBUQUERQUE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Dr. Albuquerque' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Três Corações', 'TRES CORACOES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Dr. Albuquerque' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Morumbi (parte)', 'VILA MORUMBI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Morumbi (parte)', 'MORUMBI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Auxiliadora', 'VILA AUXILIADORA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Dr. Albuquerque' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Auxiliadora', 'AUXILIADORA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Itanhangá', 'ITANHANGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Itanhangá (Parte Sul)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Itanhangá', 'JARDIM ITANHANGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Itanhangá (Parte Sul)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Rosa Pires (parte)', 'VILA ROSA PIRES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Itanhangá (Parte Sul)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Rosa Pires (parte)', 'ROSA PIRES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Itanhangá (Parte Sul)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Miguel Couto (parte)', 'VILA MIGUEL COUTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Miguel Couto', 'MIGUEL COUTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara Cachoeira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Maria Aparecida Pedrossian', 'MARIA APARECIDA PEDROSSIAN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Maria Aparecida Pedrossian', 'RESIDENCIAL MARIA APARECIDA PEDROSSIAN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Panorama', 'JARDIM PANORAMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Panorama', 'PANORAMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Oiti', 'OITI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Damha (I, II, III, IV)', 'RESIDENCIAL DAMHA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Damha (I, II, III, IV)', 'DAMHA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Chácara Cachoeira', 'CHACARA CACHOEIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara Cachoeira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cachoeira', 'CACHOEIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara Cachoeira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Moreninha', 'MORENINHA', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Nova Capital', 'VILA NOVA CAPITAL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nova Capital', 'NOVA CAPITAL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Felicidade', 'SANTA FELICIDADE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'José Maksoud', 'JOSE MAKSOUD', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Rita Vieira', 'RITA VIEIRA', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Rita Vieira (I, II e III)', 'JARDIM RITA VIEIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque Dallas', 'PARQUE DALLAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Dallas', 'DALLAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim das Mansões', 'JARDIM DAS MANSOES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'das Mansões', 'DAS MANSOES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'São Lourenço', 'SAO LOURENCO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim São Lourenço', 'JARDIM SAO LOURENCO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Vilasboas (parte)', 'VILA VILASBOAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vilasboas', 'VILASBOAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tiradentes', 'TIRADENTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Auxiliadora', 'JARDIM AUXILIADORA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Tiradentes', 'JARDIM TIRADENTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Dahma (fração)', 'RESIDENCIAL DAHMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Dahma (fração)', 'DAHMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Vitória', 'JARDIM VITORIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vitória', 'VITORIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque dos Esbórnias', 'PARQUE DOS ESBORNIAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'dos Esbórnias', 'DOS ESBORNIAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Assaf Trad', 'ASSAF TRAD', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tv Morena', 'TV MORENA', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santa Dorotheia', 'VILA SANTA DOROTHEIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Dorotheia', 'SANTA DOROTHEIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Vilasboas', 'JARDIM VILASBOAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Bela Vista (parte)', 'JARDIM BELA VISTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Bela Vista', 'BELA VISTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taveirópolis' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Novo Horizonte', 'NOVO HORIZONTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Estrela Dalva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Marques', 'VILA MARQUES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Marques', 'MARQUES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Amambai', 'AMAMBAI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Amambai', 'VILA AMAMBAI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Bandeirantes', 'VILA BANDEIRANTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Bandeirantes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Bandeirantes', 'BANDEIRANTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Bandeirantes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cabeça de Boi', 'CABECA DE BOI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Militar', 'VILA MILITAR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Militar', 'MILITAR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cabreúva', 'CABREUVA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cabreúva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Cabreúva', 'VILA CABREUVA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cabreúva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Orla Ferroviária (parte)', 'ORLA FERROVIARIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cabreúva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Estilo', 'VILA ESTILO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cabreúva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Estilo', 'ESTILO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cabreúva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Centro', 'CENTRO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Planta Original de Campo Grande', 'PLANTA ORIGINAL DE CAMPO GRANDE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Cidade', 'VILA CIDADE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cidade', 'CIDADE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Rui Barbosa', 'RUI BARBOSA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cruzeiro', 'CRUZEIRO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Cruzeiro', 'VILA CRUZEIRO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Autonomista', 'JARDIM AUTONOMISTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Autonomista' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Autonomista', 'AUTONOMISTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Autonomista' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santa Marta', 'VILA SANTA MARTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Marta', 'SANTA MARTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Sônia', 'VILA SONIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Sônia', 'SONIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Glória', 'GLORIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Glória', 'VILA GLORIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Itaimbé', 'ITAIMBE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Erica', 'VILA ERICA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Erica', 'ERICA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim dos Estados', 'JARDIM DOS ESTADOS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'dos Estados', 'DOS ESTADOS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santa Odete', 'VILA SANTA ODETE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Odete', 'SANTA ODETE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Guaraciaba', 'VILA GUARACIABA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Guaraciaba', 'GUARACIABA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Tupaceretan', 'VILA TUPACERETAN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tupaceretan', 'TUPACERETAN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Esportiva', 'VILA ESPORTIVA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Esportiva', 'ESPORTIVA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Aclimação', 'JARDIM ACLIMACAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Aclimação', 'ACLIMACAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Monte Líbano', 'MONTE LIBANO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Monte Líbano', 'JARDIM MONTE LIBANO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila São Jorge da Lagoa (parte)', 'VILA SAO JORGE DA LAGOA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'São Jorge da Lagoa (parte)', 'SAO JORGE DA LAGOA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Kellen', 'VILA KELLEN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Kellen', 'KELLEN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Planalto', 'PLANALTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Planalto', 'VILA PLANALTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Militar da Aeronáutica', 'VILA MILITAR DA AERONAUTICA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Militar da Aeronáutica', 'MILITAR DA AERONAUTICA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Base Aérea', 'BASE AEREA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Sobrinho', 'VILA SOBRINHO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Sobrinho', 'SOBRINHO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Fé', 'SANTA FE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Santa Fé', 'JARDIM SANTA FE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé (Parte Centro)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'West Park', 'WEST PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Célia (parte)', 'VILA CELIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé (Parte Centro)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Célia (parte)', 'CELIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé (Parte Centro)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'São Francisco', 'SAO FRANCISCO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Francisco' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila São Francisco', 'VILA SAO FRANCISCO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Francisco' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Lara', 'JARDIM LARA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Conrado' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Lara', 'LARA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Monte Castelo', 'MONTE CASTELO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Castelo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Integração', 'VILA INTEGRACAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Francisco' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Integração', 'INTEGRACAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Francisco' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nova Campo Grande', 'NOVA CAMPO GRANDE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Iná', 'JARDIM INA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Iná', 'INA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Serradinho', 'VILA SERRADINHO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Serradinho', 'SERRADINHO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Carioca', 'JARDIM CARIOCA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Carioca', 'CARIOCA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Núcleo Industrial', 'NUCLEO INDUSTRIAL', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Polo Empresarial de Campo Grande', 'POLO EMPRESARIAL DE CAMPO GRANDE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Indubrasil', 'INDUBRASIL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Nelson Trad', 'RESIDENCIAL NELSON TRAD', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nelson Trad', 'NELSON TRAD', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Panamá', 'PANAMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Panamá', 'JARDIM PANAMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial West Park', 'RESIDENCIAL WEST PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Alba', 'VILA ALBA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Alba', 'ALBA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Zé Pereira (parte)', 'ZE PEREIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Popular', 'POPULAR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Popular', 'VILA POPULAR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Sayonara', 'JARDIM SAYONARA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Sayonara', 'SAYONARA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Zé Pereira (parte)', 'VILA ZE PEREIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Romano', 'ROMANO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santo Amaro', 'SANTO AMARO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Amaro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santo Amaro', 'VILA SANTO AMARO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Amaro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Almeida', 'VILA ALMEIDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Amaro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Almeida', 'ALMEIDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Amaro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santo Antônio', 'SANTO ANTONIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santo Antônio', 'VILA SANTO ANTONIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Silvia Regina', 'SILVIA REGINA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Imá', 'JARDIM IMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Imá', 'IMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Recanto dos Pássaros', 'RECANTO DOS PASSAROS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Zapran', 'ZAPRAN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Lara', 'VILA LARA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Palos Verdes', 'JARDIM PALOS VERDES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Palos Verdes', 'PALOS VERDES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nova Bandeirantes (parte)', 'NOVA BANDEIRANTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taveirópolis' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Argolo', 'VILA ARGOLO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Bandeirantes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Argolo', 'ARGOLO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Bandeirantes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Batistão', 'BATISTAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Batistão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Batistão', 'JARDIM BATISTAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Batistão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim São Conrado', 'JARDIM SAO CONRADO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Conrado' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'São Conrado (parte)', 'SAO CONRADO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tijuca' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tijuca (I e II)', 'TIJUCA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tijuca' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Caiobá (I, II e III)', 'CAIOBA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Portal Caiobá (I, II e III)', 'PORTAL CAIOBA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Rancho Alegre', 'RANCHO ALEGRE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Celina Jallad', 'RESIDENCIAL CELINA JALLAD', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Celina Jallad', 'CELINA JALLAD', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Nova Jerusalém', 'VILA NOVA JERUSALEM', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nova Jerusalém', 'NOVA JERUSALEM', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'COOPHAVILA II', 'COOPHAVILA', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Conjunto Habitacional Coophavila II', 'CONJUNTO HABITACIONAL COOPHAVILA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cohab Coophavila II', 'COHAB COOPHAVILA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'CH Coophavila II', 'CHACARA COOPHAVILA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Habitacional Coophavila II', 'HABITACIONAL COOPHAVILA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Tarumã', 'JARDIM TARUMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tarumã' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tarumã', 'TARUMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tarumã' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Marambaia', 'MARAMBAIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Guanandi', 'GUANANDI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Guanandi', 'VILA GUANANDI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Miramontes', 'MIRAMONTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Europa', 'JARDIM EUROPA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Europa', 'EUROPA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Leblon', 'LEBLON', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Leblon' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Leblon', 'VILA LEBLON', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Leblon' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nova Guaporé', 'NOVA GUAPORE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Leblon' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Oliveira', 'RESIDENCIAL OLIVEIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tarumã' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Oliveira', 'OLIVEIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tarumã' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Taveiropolis', 'TAVEIROPOLIS', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taveirópolis' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'vl Taveiropolis', 'VILA TAVEIROPOLIS', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taveirópolis' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Nova Bandeirantes (parte)', 'VILA NOVA BANDEIRANTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taveirópolis' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Tijuca (I e II)', 'JARDIM TIJUCA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tijuca' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Conjunto Lagoa', 'CONJUNTO LAGOA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tijuca' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Lagoa', 'LAGOA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tijuca' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'União', 'UNIAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'União' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Conjunto União', 'CONJUNTO UNIAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'União' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nascente do Segredo (parte)', 'NASCENTE DO SEGREDO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'União' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Base', 'VILA BASE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'União' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Base', 'BASE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'União' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Margarida', 'VILA MARGARIDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Margarida' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Margarida', 'MARGARIDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Margarida' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Carandá', 'CARANDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carandá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Carandá Bosque (I e II)', 'CARANDA BOSQUE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carandá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Pousada do Pescador', 'RESIDENCIAL POUSADA DO PESCADOR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carandá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Pousada do Pescador', 'POUSADA DO PESCADOR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carandá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residenciais do Bosque', 'RESIDENCIAIS DO BOSQUE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara Cachoeira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'CHACARA dos Poderes', 'CHACARA DOS PODERES', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara dos Poderes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'dos Poderes', 'DOS PODERES', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara dos Poderes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Green Park', 'GREEN PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara dos Poderes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Estrela Dalva', 'ESTRELA DALVA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Estrela Dalva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Estrela Dalva', 'JARDIM ESTRELA DALVA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Estrela Dalva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tamandaré', 'TAMANDARE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Giocondo Orsi', 'GIOCONDO ORSI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Margarida' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Kaveira', 'KAVEIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Margarida' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Mata do Jacinto', 'MATA DO JACINTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Conjunto Habitacional Mata do Jacinto', 'CONJUNTO HABITACIONAL MATA DO JACINTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cohab Mata do Jacinto', 'COHAB MATA DO JACINTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'CH Mata do Jacinto', 'CHACARA MATA DO JACINTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Habitacional Mata do Jacinto', 'HABITACIONAL MATA DO JACINTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Sóter', 'SOTER', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Royal Park', 'RESIDENCIAL ROYAL PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Royal Park', 'ROYAL PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Noroeste', 'NOROESTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Noroeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Noroeste', 'JARDIM NOROESTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Noroeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Serraville', 'SERRAVILLE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Noroeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Green Society', 'RESIDENCIAL GREEN SOCIETY', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Noroeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Green Society', 'GREEN SOCIETY', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Noroeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Novos Estados', 'NOVOS ESTADOS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Novos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Novos Estados', 'JARDIM NOVOS ESTADOS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Novos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque Novos Estados', 'PARQUE NOVOS ESTADOS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Novos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Estrela Park', 'RESIDENCIAL ESTRELA PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Novos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Estrela Park', 'ESTRELA PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Novos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Polon', 'VILA POLON', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Polon', 'POLON', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Altos da Afonso Pena', 'ALTOS DA AFONSO PENA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Veraneio', 'VERANEIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Veraneio', 'JARDIM VERANEIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque dos Poderes (Setor Administrativo)', 'PARQUE DOS PODERES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Alphaville (I, II, III, IV)', 'RESIDENCIAL ALPHAVILLE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Alphaville (I, II, III, IV)', 'ALPHAVILLE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Coronel Antonino', 'CORONEL ANTONINO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Coronel Antonino', 'VILA CORONEL ANTONINO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Estrela do Sul', 'ESTRELA DO SUL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Rica', 'VILA RICA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Rica', 'RICA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'José Abrão', 'JOSE ABRAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Conjunto Habitacional José Abrão', 'CONJUNTO HABITACIONAL JOSE ABRAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cohab José Abrão', 'COHAB JOSE ABRAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'CH José Abrão', 'CHACARA JOSE ABRAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Habitacional José Abrão', 'HABITACIONAL JOSE ABRAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Luzia', 'SANTA LUZIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Mata do Segredo', 'MATA DO SEGREDO', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Segredo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Presidente', 'JARDIM PRESIDENTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Segredo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Presidente', 'PRESIDENTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Segredo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Parati (fração)', 'RESIDENCIAL PARATI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Segredo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Campo Belo', 'CAMPO BELO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Monte Castelo', 'VILA MONTE CASTELO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Castelo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Segredo', 'SEGREDO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Castelo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'VL Nasser', 'VILA NASSER', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nasser', 'NASSER', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Paradiso', 'JARDIM PARADISO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Paradiso', 'PARADISO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Siriema', 'SIRIEMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Carmen', 'SANTA CARMEN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nova Lima', 'NOVA LIMA', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Nova Lima', 'JARDIM NOVA LIMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Anache', 'JARDIM ANACHE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Anache', 'ANACHE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Columbia', 'JARDIM COLUMBIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Columbia', 'COLUMBIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Campo Belo', 'JARDIM CAMPO BELO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tarsila do Amaral', 'TARSILA DO AMARAL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Seminario', 'SEMINARIO', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'jd Seminario', 'JARDIM SEMINARIO', 'refinamento', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Marli', 'VILA MARLI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Marli', 'MARLI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Dedé', 'VILA DEDE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Dedé', 'DEDE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'JD Amambai', 'JARDIM AMAMBAI', 'refinamento', 95
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Coop Havila', 'COOP HAVILA', 'refinamento', 90
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'JD Veneza', 'JARDIM VENEZA', 'refinamento', 85
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Veneza', 'VENEZA', 'refinamento', 85
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Itanhangá Sul', 'ITANHANGA SUL', 'refinamento', 95
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Itanhangá (Parte Sul)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'jd Itanhangá Sul', 'JARDIM ITANHANGA SUL', 'refinamento', 90
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Itanhangá (Parte Sul)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Fé Centro', 'SANTA FE CENTRO', 'refinamento', 95
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé (Parte Centro)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'jd Flamboyant', 'JARDIM FLAMBOYANT', 'refinamento', 90
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Flamboyant', 'FLAMBOYANT', 'refinamento', 90
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'West Park Panamá', 'WEST PARK PANAMA', 'refinamento', 90
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Polo Empresarial', 'POLO EMPRESARIAL', 'refinamento', 90
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Planta Original', 'PLANTA ORIGINAL', 'refinamento', 90
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Novo Horizonte Vilasboas', 'NOVO HORIZONTE VILASBOAS', 'refinamento', 90
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = EXCLUDED.tipo_correspondencia,
  confianca = GREATEST(geo_sinonimos.confianca, EXCLUDED.confianca);

