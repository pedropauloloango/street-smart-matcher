-- Base oficial GeoBairros CG — Campo Grande-MS (7 regiões urbanas, 67 bairros oficiais)
-- Gerado por scripts/generate-geo-oficial-seed.mjs

-- Desativa entradas do seed de amostra substituídas pela base oficial
UPDATE public.geo_bairros SET ativo = false
WHERE bairro_oficial IN ('Amambaí', 'Bandeira', 'Bela Vista', 'Jardim Veneza', 'Coophavila', 'Vila Nasser', 'Jardim Leblon', 'Jardim Seminário');

INSERT INTO public.geo_bairros (bairro_oficial, regiao_urbana) VALUES
  ('Aero Rancho', 'Anhanduizinho'),
  ('Alves Pereira', 'Anhanduizinho'),
  ('Centenário', 'Anhanduizinho'),
  ('Centro Oeste', 'Anhanduizinho'),
  ('Jacy', 'Anhanduizinho'),
  ('Los Angeles', 'Anhanduizinho'),
  ('Parati', 'Anhanduizinho'),
  ('Pioneiros', 'Anhanduizinho'),
  ('Piratininga', 'Anhanduizinho'),
  ('Taquarussu', 'Anhanduizinho'),
  ('Universitário', 'Anhanduizinho'),
  ('Carlota', 'Bandeira'),
  ('Dr. Albuquerque', 'Bandeira'),
  ('Itanhangá (Parte Sul)', 'Bandeira'),
  ('Maria Aparecida Pedrossian', 'Bandeira'),
  ('Moreninha', 'Bandeira'),
  ('Rita Vieira', 'Bandeira'),
  ('São Lourenço', 'Bandeira'),
  ('Tiradentes', 'Bandeira'),
  ('Tv Morena', 'Bandeira'),
  ('Vilasboas', 'Bandeira'),
  ('Amambai', 'Centro'),
  ('Cabreúva', 'Centro'),
  ('Centro', 'Centro'),
  ('Cruzeiro', 'Centro'),
  ('Glória', 'Centro'),
  ('Jardim dos Estados', 'Centro'),
  ('Monte Líbano', 'Centro'),
  ('Planalto', 'Centro'),
  ('Santa Fé (Parte Centro)', 'Centro'),
  ('São Francisco', 'Centro'),
  ('Nova Campo Grande', 'Imbirussu'),
  ('Núcleo Industrial', 'Imbirussu'),
  ('Panamá', 'Imbirussu'),
  ('Popular', 'Imbirussu'),
  ('Santo Amaro', 'Imbirussu'),
  ('Santo Antônio', 'Imbirussu'),
  ('Sobrinho', 'Imbirussu'),
  ('Bandeirantes', 'Lagoa'),
  ('Batistão', 'Lagoa'),
  ('Caiobá', 'Lagoa'),
  ('Coophavila II', 'Lagoa'),
  ('Guanandi', 'Lagoa'),
  ('Leblon', 'Lagoa'),
  ('São Conrado', 'Lagoa'),
  ('Tarumã', 'Lagoa'),
  ('Taveirópolis', 'Lagoa'),
  ('Tijuca', 'Lagoa'),
  ('União', 'Lagoa'),
  ('Autonomista', 'Prosa'),
  ('Carandá', 'Prosa'),
  ('Chácara Cachoeira', 'Prosa'),
  ('Chácara dos Poderes', 'Prosa'),
  ('Estrela Dalva', 'Prosa'),
  ('Margarida', 'Prosa'),
  ('Mata do Jacinto', 'Prosa'),
  ('Noroeste', 'Prosa'),
  ('Novos Estados', 'Prosa'),
  ('Santa Fé', 'Prosa'),
  ('Veraneio', 'Prosa'),
  ('Coronel Antonino', 'Segredo'),
  ('José Abrão', 'Segredo'),
  ('Mata do Segredo', 'Segredo'),
  ('Monte Castelo', 'Segredo'),
  ('Nasser', 'Segredo'),
  ('Nova Lima', 'Segredo'),
  ('Seminário', 'Segredo')
ON CONFLICT (bairro_oficial) DO UPDATE SET
  regiao_urbana = EXCLUDED.regiao_urbana,
  ativo = true;

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Conjunto Habitacional Aero Rancho (Setores de I a VII)'), ('Dona Júlia'), ('Vila Ana Maria'), ('Jardim das Hortênsias'), ('Parque do Sol (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Alves Pereira'), ('Santa Maria'), ('Vila Novo Século'), ('Jardim Morente'), ('Residencial Betaville')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Centenário'), ('Iracy Coelho (I, II e III)'), ('Parque Lageado'), ('Jardim Santa Emília (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Centenário' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Centro Oeste'), ('Jardim Colorado'), ('Jardim Macaúbas'), ('Parque Novo Século'), ('Jardim Canguru'), ('Marajoara')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Jacy'), ('Jardim Paulista (parte)'), ('IPÊ'), ('Vila Paraíso'), ('Vila Progresso (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Los Angeles'), ('Jardim Uirapuru'), ('Vegas'), ('Parque do Sol'), ('Jardim Campo Nobre'), ('Morada do Sol')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Parati'), ('Jardim Monte Alegre'), ('Piratininga (parte)'), ('Jardim Anápolis'), ('Residencial Spalding')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Pioneiros'), ('Jardim Botafogo'), ('Vila Adelina'), ('Joana D''Arc'), ('Vila Divisória')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Piratininga'), ('Jardim Nhanhá'), ('Promorar'), ('Vila Ipiranga'), ('Núcleo Piratininga'), ('Vila Getúlia Barbosa')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Taquarussu'), ('Vila Carvalho (parte)'), ('Jardim Jacy (parte)'), ('Vila Belo Horizonte')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Universitário'), ('Vila Olinda'), ('Jardim Dynamic'), ('Cohab Universitária'), ('Jardim Continental'), ('Vila Maciel')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Carlota'), ('Vila Albuquerque (parte)'), ('Jardim Its'), ('Vila Santos Dumont'), ('Mansur')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Albuquerque'), ('Três Corações'), ('Vila Morumbi'), ('Vila Auxiliadora')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Dr. Albuquerque' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Itanhangá'), ('Vila Rosa Pires (parte)'), ('Vila Miguel Couto')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Itanhangá (Parte Sul)' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Residencial Maria Aparecida Pedrossian'), ('Jardim Panorama'), ('Oiti'), ('Residencial Damha (I, II, III, IV)'), ('Chácara Cachoeira (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Moreninha I'), ('Moreninha II'), ('Moreninha III'), ('Moreninha IV'), ('Vila Nova Capital'), ('Santa Felicidade'), ('José Maksoud')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Rita Vieira (I, II e III)'), ('Parque Dallas'), ('Vila Morumbi (parte)'), ('Jardim das Mansões')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim São Lourenço'), ('Vila Vilasboas (parte)'), ('Tiradentes (parte)'), ('Jardim Auxiliadora')) AS v(parcelamento)
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Tiradentes'), ('Residencial Dahma (fração)'), ('Jardim Vitória'), ('Parque dos Esbórnias'), ('Assaf Trad')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Paulista'), ('Vila Santa Dorotheia'), ('Vila Albuquerque (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Vilasboas'), ('Jardim Bela Vista (parte)'), ('Novo Horizonte'), ('Vila Marques')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Amambai'), ('Vila Bandeirantes (parte)'), ('Cabeça de Boi'), ('Vila Militar')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Cabreúva'), ('Orla Ferroviária (parte)'), ('Vila Estilo')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Cabreúva' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Planta Original de Campo Grande'), ('Vila Cidade'), ('Rui Barbosa')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Cruzeiro'), ('Jardim Autonomista (parte)'), ('Vila Santa Marta'), ('Vila Sônia')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Glória'), ('Itaimbé'), ('Vila Miguel Couto (parte)'), ('Vila Erica')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim dos Estados'), ('Vila Santa Odete'), ('Vila Guaraciaba'), ('Vila Tupaceretan'), ('Vila Esportiva'), ('Jardim Aclimação')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Monte Líbano'), ('Vila São Jorge da Lagoa (parte)'), ('Vila Kellen')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Planalto'), ('Vila Militar da Aeronáutica'), ('Base Aérea'), ('Vila Sobrinho (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Santa Fé'), ('West Park'), ('Vila Célia (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Santa Fé (Parte Centro)' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila São Francisco'), ('Jardim Lara'), ('Monte Castelo (parte)'), ('Vila Integração')) AS v(parcelamento)
WHERE b.bairro_oficial = 'São Francisco' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Nova Campo Grande'), ('Jardim Iná'), ('Vila Serradinho'), ('Jardim Carioca')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Polo Empresarial de Campo Grande'), ('Indubrasil'), ('Residencial Nelson Trad')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Panamá'), ('Residencial West Park'), ('Vila Alba'), ('Zé Pereira')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Popular'), ('Jardim Sayonara'), ('Vila Zé Pereira (parte)'), ('Romano')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Santo Amaro'), ('Vila Almeida'), ('Jardim Lara'), ('Santo Antônio (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Santo Amaro' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Santo Antônio'), ('Silvia Regina'), ('Jardim Imá'), ('Recanto dos Pássaros')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Sobrinho'), ('Zapran'), ('Vila Lara'), ('Jardim Palos Verdes')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Bandeirantes'), ('Nova Bandeirantes'), ('Vila Argolo')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Bandeirantes' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Batistão'), ('Jardim São Conrado (parte)'), ('Tijuca (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Batistão' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Portal Caiobá (I, II e III)'), ('Rancho Alegre'), ('Residencial Celina Jallad'), ('Vila Nova Jerusalém')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Conjunto Habitacional Coophavila II'), ('Jardim Tarumã (parte)'), ('Marambaia')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Guanandi'), ('Miramontes'), ('Vila Jacy (parte)'), ('Jardim Europa')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Leblon'), ('Jardim Centenário (parte)'), ('Nova Guaporé')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Leblon' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim São Conrado'), ('Santa Emília'), ('Jardim Lara')) AS v(parcelamento)
WHERE b.bairro_oficial = 'São Conrado' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Tarumã'), ('Coophavila (fração)'), ('Residencial Oliveira')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Tarumã' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Taveirópolis'), ('Bela Vista'), ('Vila Nova Bandeirantes (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Taveirópolis' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Tijuca (I e II)'), ('São Conrado (parte)'), ('Conjunto Lagoa')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Tijuca' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Conjunto União'), ('Nascente do Segredo (parte)'), ('Vila Base')) AS v(parcelamento)
WHERE b.bairro_oficial = 'União' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Autonomista'), ('Vila Margarida (parte)'), ('Santa Fé (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Autonomista' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Carandá Bosque (I e II)'), ('Residencial Pousada do Pescador')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Carandá' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Chácara Cachoeira'), ('Miguel Couto'), ('Residenciais do Bosque')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Chácara Cachoeira' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Chácara dos Poderes'), ('Green Park')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Chácara dos Poderes' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Estrela Dalva'), ('Tamandaré'), ('Novo Horizonte')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Estrela Dalva' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Margarida'), ('Giocondo Orsi'), ('Kaveira')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Margarida' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Conjunto Habitacional Mata do Jacinto'), ('Sóter'), ('Residencial Royal Park')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Noroeste'), ('Serraville'), ('Residencial Green Society')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Noroeste' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Novos Estados'), ('Parque Novos Estados'), ('Residencial Estrela Park')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Novos Estados' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Santa Fé'), ('Vila Polon'), ('Altos da Afonso Pena')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Santa Fé' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Veraneio'), ('Parque dos Poderes (Setor Administrativo)'), ('Residencial Alphaville (I, II, III, IV)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Coronel Antonino'), ('Estrela do Sul'), ('Vila Rica'), ('IPÊ')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Conjunto Habitacional José Abrão'), ('Santa Luzia'), ('Vila Lara')) AS v(parcelamento)
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Mata do Segredo'), ('Jardim Presidente'), ('Residencial Parati (fração)'), ('Campo Belo')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Mata do Segredo' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Monte Castelo'), ('Segredo'), ('Vila Nasser (parte)')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Monte Castelo' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Vila Nasser'), ('Jardim Paradiso'), ('Siriema'), ('Santa Carmen')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Nova Lima'), ('Jardim Anache'), ('Jardim Columbia'), ('Jardim Campo Belo'), ('Tarsila do Amaral')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('Jardim Seminário'), ('Vila Marli'), ('Tamandaré'), ('Vila Dedé')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Aero Rancho', 'AERO RANCHO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Conjunto Habitacional Aero Rancho (Setores de I a VII)', 'CONJUNTO HABITACIONAL AERO RANCHO SETORES DE I A VII', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Dona Júlia', 'DONA JULIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Ana Maria', 'VILA ANA MARIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim das Hortênsias', 'JARDIM DAS HORTENSIAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque do Sol (parte)', 'PARQUE DO SOL PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Alves Pereira', 'ALVES PEREIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Alves Pereira', 'JARDIM ALVES PEREIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Maria', 'SANTA MARIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Novo Século', 'VILA NOVO SECULO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Morente', 'JARDIM MORENTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Betaville', 'RESIDENCIAL BETAVILLE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Centenário', 'CENTENARIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centenário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Centenário', 'JARDIM CENTENARIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centenário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Iracy Coelho (I, II e III)', 'IRACY COELHO I II E III', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centenário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque Lageado', 'PARQUE LAGEADO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centenário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Santa Emília (parte)', 'JARDIM SANTA EMILIA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centenário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Centro Oeste', 'CENTRO OESTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Centro Oeste', 'JARDIM CENTRO OESTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Colorado', 'JARDIM COLORADO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Macaúbas', 'JARDIM MACAUBAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque Novo Século', 'PARQUE NOVO SECULO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Canguru', 'JARDIM CANGURU', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Marajoara', 'MARAJOARA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jacy', 'JACY', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Jacy', 'VILA JACY', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Paulista (parte)', 'JARDIM PAULISTA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'IPÊ', 'IPE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Paraíso', 'VILA PARAISO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Progresso (parte)', 'VILA PROGRESSO PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Los Angeles', 'LOS ANGELES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Los Angeles', 'JARDIM LOS ANGELES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Uirapuru', 'JARDIM UIRAPURU', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vegas', 'VEGAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque do Sol', 'PARQUE DO SOL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Campo Nobre', 'JARDIM CAMPO NOBRE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Morada do Sol', 'MORADA DO SOL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parati', 'PARATI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Parati', 'JARDIM PARATI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Monte Alegre', 'JARDIM MONTE ALEGRE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Piratininga (parte)', 'PIRATININGA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Anápolis', 'JARDIM ANAPOLIS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Spalding', 'RESIDENCIAL SPALDING', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Pioneiros', 'PIONEIROS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Pioneiros', 'VILA PIONEIROS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Botafogo', 'JARDIM BOTAFOGO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Adelina', 'VILA ADELINA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Joana D''Arc', 'JOANA D ARC', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Divisória', 'VILA DIVISORIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Piratininga', 'PIRATININGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Piratininga', 'VILA PIRATININGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Nhanhá', 'JARDIM NHANHA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Promorar', 'PROMORAR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Ipiranga', 'VILA IPIRANGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Núcleo Piratininga', 'NUCLEO PIRATININGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Getúlia Barbosa', 'VILA GETULIA BARBOSA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Taquarussu', 'TAQUARUSSU', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Taquarussu', 'VILA TAQUARUSSU', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Carvalho (parte)', 'VILA CARVALHO PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Jacy (parte)', 'JARDIM JACY PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Belo Horizonte', 'VILA BELO HORIZONTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Universitário', 'UNIVERSITARIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Universitário', 'JARDIM UNIVERSITARIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Olinda', 'VILA OLINDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Dynamic', 'JARDIM DYNAMIC', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cohab Universitária', 'COHAB UNIVERSITARIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Continental', 'JARDIM CONTINENTAL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Maciel', 'VILA MACIEL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Carlota', 'CARLOTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Carlota', 'JARDIM CARLOTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Albuquerque (parte)', 'VILA ALBUQUERQUE PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Its', 'JARDIM ITS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santos Dumont', 'VILA SANTOS DUMONT', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Mansur', 'MANSUR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Dr. Albuquerque', 'DR ALBUQUERQUE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Dr. Albuquerque' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Albuquerque', 'VILA ALBUQUERQUE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Dr. Albuquerque' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Três Corações', 'TRES CORACOES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Dr. Albuquerque' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Morumbi', 'VILA MORUMBI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Dr. Albuquerque' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Auxiliadora', 'VILA AUXILIADORA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Dr. Albuquerque' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Itanhangá (Parte Sul)', 'ITANHANGA PARTE SUL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Itanhangá (Parte Sul)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Itanhangá', 'JARDIM ITANHANGA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Itanhangá (Parte Sul)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Rosa Pires (parte)', 'VILA ROSA PIRES PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Itanhangá (Parte Sul)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Miguel Couto', 'VILA MIGUEL COUTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Itanhangá (Parte Sul)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Maria Aparecida Pedrossian', 'MARIA APARECIDA PEDROSSIAN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Maria Aparecida Pedrossian', 'RESIDENCIAL MARIA APARECIDA PEDROSSIAN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Panorama', 'JARDIM PANORAMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Oiti', 'OITI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Damha (I, II, III, IV)', 'RESIDENCIAL DAMHA I II III IV', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Chácara Cachoeira (parte)', 'CHACARA CACHOEIRA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Moreninha', 'MORENINHA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Moreninha I', 'MORENINHA I', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Moreninha II', 'MORENINHA II', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Moreninha III', 'MORENINHA III', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Moreninha IV', 'MORENINHA IV', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Nova Capital', 'VILA NOVA CAPITAL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Felicidade', 'SANTA FELICIDADE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'José Maksoud', 'JOSE MAKSOUD', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Rita Vieira', 'RITA VIEIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Rita Vieira (I, II e III)', 'JARDIM RITA VIEIRA I II E III', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque Dallas', 'PARQUE DALLAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Morumbi (parte)', 'VILA MORUMBI PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim das Mansões', 'JARDIM DAS MANSOES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'São Lourenço', 'SAO LOURENCO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim São Lourenço', 'JARDIM SAO LOURENCO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Vilasboas (parte)', 'VILA VILASBOAS PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tiradentes (parte)', 'TIRADENTES PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Auxiliadora', 'JARDIM AUXILIADORA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tiradentes', 'TIRADENTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Tiradentes', 'JARDIM TIRADENTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Dahma (fração)', 'RESIDENCIAL DAHMA FRACAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Vitória', 'JARDIM VITORIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque dos Esbórnias', 'PARQUE DOS ESBORNIAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Assaf Trad', 'ASSAF TRAD', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tv Morena', 'TV MORENA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Paulista', 'JARDIM PAULISTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santa Dorotheia', 'VILA SANTA DOROTHEIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vilasboas', 'VILASBOAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Vilasboas', 'JARDIM VILASBOAS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Bela Vista (parte)', 'JARDIM BELA VISTA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Novo Horizonte', 'NOVO HORIZONTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Marques', 'VILA MARQUES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Amambai', 'AMAMBAI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Amambai', 'VILA AMAMBAI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Bandeirantes (parte)', 'VILA BANDEIRANTES PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cabeça de Boi', 'CABECA DE BOI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Militar', 'VILA MILITAR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Amambai' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cabreúva', 'CABREUVA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cabreúva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Cabreúva', 'VILA CABREUVA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cabreúva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Orla Ferroviária (parte)', 'ORLA FERROVIARIA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cabreúva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Estilo', 'VILA ESTILO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cabreúva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Centro', 'CENTRO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Planta Original de Campo Grande', 'PLANTA ORIGINAL DE CAMPO GRANDE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Cidade', 'VILA CIDADE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Rui Barbosa', 'RUI BARBOSA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Cruzeiro', 'CRUZEIRO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Cruzeiro', 'VILA CRUZEIRO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Autonomista (parte)', 'JARDIM AUTONOMISTA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santa Marta', 'VILA SANTA MARTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Sônia', 'VILA SONIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Glória', 'GLORIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Glória', 'VILA GLORIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Itaimbé', 'ITAIMBE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Miguel Couto (parte)', 'VILA MIGUEL COUTO PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Erica', 'VILA ERICA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim dos Estados', 'JARDIM DOS ESTADOS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santa Odete', 'VILA SANTA ODETE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Guaraciaba', 'VILA GUARACIABA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Tupaceretan', 'VILA TUPACERETAN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Esportiva', 'VILA ESPORTIVA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Aclimação', 'JARDIM ACLIMACAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Monte Líbano', 'MONTE LIBANO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Monte Líbano', 'JARDIM MONTE LIBANO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila São Jorge da Lagoa (parte)', 'VILA SAO JORGE DA LAGOA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Kellen', 'VILA KELLEN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Planalto', 'PLANALTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Planalto', 'VILA PLANALTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Militar da Aeronáutica', 'VILA MILITAR DA AERONAUTICA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Base Aérea', 'BASE AEREA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Sobrinho (parte)', 'VILA SOBRINHO PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Fé (Parte Centro)', 'SANTA FE PARTE CENTRO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé (Parte Centro)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Santa Fé', 'JARDIM SANTA FE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé (Parte Centro)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'West Park', 'WEST PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé (Parte Centro)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Célia (parte)', 'VILA CELIA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé (Parte Centro)' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'São Francisco', 'SAO FRANCISCO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Francisco' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila São Francisco', 'VILA SAO FRANCISCO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Francisco' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Lara', 'JARDIM LARA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Francisco' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Monte Castelo (parte)', 'MONTE CASTELO PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Francisco' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Integração', 'VILA INTEGRACAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Francisco' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nova Campo Grande', 'NOVA CAMPO GRANDE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Iná', 'JARDIM INA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Serradinho', 'VILA SERRADINHO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Carioca', 'JARDIM CARIOCA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Núcleo Industrial', 'NUCLEO INDUSTRIAL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Polo Empresarial de Campo Grande', 'POLO EMPRESARIAL DE CAMPO GRANDE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Indubrasil', 'INDUBRASIL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Nelson Trad', 'RESIDENCIAL NELSON TRAD', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Panamá', 'PANAMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Panamá', 'JARDIM PANAMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial West Park', 'RESIDENCIAL WEST PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Alba', 'VILA ALBA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Zé Pereira', 'ZE PEREIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Popular', 'POPULAR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Popular', 'VILA POPULAR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Sayonara', 'JARDIM SAYONARA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Zé Pereira (parte)', 'VILA ZE PEREIRA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Romano', 'ROMANO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santo Amaro', 'SANTO AMARO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Amaro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santo Amaro', 'VILA SANTO AMARO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Amaro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Almeida', 'VILA ALMEIDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Amaro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santo Antônio (parte)', 'SANTO ANTONIO PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Amaro' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santo Antônio', 'SANTO ANTONIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Santo Antônio', 'VILA SANTO ANTONIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Silvia Regina', 'SILVIA REGINA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Imá', 'JARDIM IMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Recanto dos Pássaros', 'RECANTO DOS PASSAROS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Sobrinho', 'SOBRINHO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Sobrinho', 'VILA SOBRINHO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Zapran', 'ZAPRAN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Lara', 'VILA LARA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Palos Verdes', 'JARDIM PALOS VERDES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Bandeirantes', 'BANDEIRANTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Bandeirantes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Bandeirantes', 'VILA BANDEIRANTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Bandeirantes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nova Bandeirantes', 'NOVA BANDEIRANTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Bandeirantes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Argolo', 'VILA ARGOLO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Bandeirantes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Batistão', 'BATISTAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Batistão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Batistão', 'JARDIM BATISTAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Batistão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim São Conrado (parte)', 'JARDIM SAO CONRADO PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Batistão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tijuca (parte)', 'TIJUCA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Batistão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Caiobá', 'CAIOBA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Portal Caiobá (I, II e III)', 'PORTAL CAIOBA I II E III', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Rancho Alegre', 'RANCHO ALEGRE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Celina Jallad', 'RESIDENCIAL CELINA JALLAD', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Nova Jerusalém', 'VILA NOVA JERUSALEM', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Coophavila II', 'COOPHAVILA II', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Conjunto Habitacional Coophavila II', 'CONJUNTO HABITACIONAL COOPHAVILA II', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Tarumã (parte)', 'JARDIM TARUMA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Marambaia', 'MARAMBAIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Guanandi', 'GUANANDI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Guanandi', 'VILA GUANANDI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Miramontes', 'MIRAMONTES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Jacy (parte)', 'VILA JACY PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Europa', 'JARDIM EUROPA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Leblon', 'LEBLON', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Leblon' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Leblon', 'VILA LEBLON', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Leblon' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Centenário (parte)', 'JARDIM CENTENARIO PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Leblon' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nova Guaporé', 'NOVA GUAPORE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Leblon' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'São Conrado', 'SAO CONRADO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Conrado' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim São Conrado', 'JARDIM SAO CONRADO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Conrado' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Emília', 'SANTA EMILIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'São Conrado' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tarumã', 'TARUMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tarumã' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Tarumã', 'JARDIM TARUMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tarumã' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Coophavila (fração)', 'COOPHAVILA FRACAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tarumã' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Oliveira', 'RESIDENCIAL OLIVEIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tarumã' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Taveirópolis', 'TAVEIROPOLIS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taveirópolis' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Taveirópolis', 'VILA TAVEIROPOLIS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taveirópolis' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Bela Vista', 'BELA VISTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taveirópolis' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Nova Bandeirantes (parte)', 'VILA NOVA BANDEIRANTES PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Taveirópolis' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tijuca', 'TIJUCA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tijuca' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Tijuca (I e II)', 'JARDIM TIJUCA I E II', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tijuca' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'São Conrado (parte)', 'SAO CONRADO PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tijuca' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Conjunto Lagoa', 'CONJUNTO LAGOA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Tijuca' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'União', 'UNIAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'União' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Conjunto União', 'CONJUNTO UNIAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'União' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nascente do Segredo (parte)', 'NASCENTE DO SEGREDO PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'União' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Base', 'VILA BASE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'União' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Autonomista', 'AUTONOMISTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Autonomista' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Autonomista', 'JARDIM AUTONOMISTA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Autonomista' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Margarida (parte)', 'VILA MARGARIDA PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Autonomista' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Fé (parte)', 'SANTA FE PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Autonomista' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Carandá', 'CARANDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carandá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Carandá Bosque (I e II)', 'CARANDA BOSQUE I E II', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carandá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Pousada do Pescador', 'RESIDENCIAL POUSADA DO PESCADOR', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Carandá' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Chácara Cachoeira', 'CHACARA CACHOEIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara Cachoeira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Miguel Couto', 'MIGUEL COUTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara Cachoeira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residenciais do Bosque', 'RESIDENCIAIS DO BOSQUE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara Cachoeira' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Chácara dos Poderes', 'CHACARA DOS PODERES', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara dos Poderes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Green Park', 'GREEN PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Chácara dos Poderes' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Estrela Dalva', 'ESTRELA DALVA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Estrela Dalva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Estrela Dalva', 'JARDIM ESTRELA DALVA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Estrela Dalva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tamandaré', 'TAMANDARE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Estrela Dalva' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Margarida', 'MARGARIDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Margarida' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Margarida', 'VILA MARGARIDA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Margarida' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Giocondo Orsi', 'GIOCONDO ORSI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Margarida' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Kaveira', 'KAVEIRA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Margarida' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Mata do Jacinto', 'MATA DO JACINTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Conjunto Habitacional Mata do Jacinto', 'CONJUNTO HABITACIONAL MATA DO JACINTO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Sóter', 'SOTER', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Royal Park', 'RESIDENCIAL ROYAL PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Noroeste', 'NOROESTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Noroeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Noroeste', 'JARDIM NOROESTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Noroeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Serraville', 'SERRAVILLE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Noroeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Green Society', 'RESIDENCIAL GREEN SOCIETY', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Noroeste' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Novos Estados', 'NOVOS ESTADOS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Novos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Novos Estados', 'JARDIM NOVOS ESTADOS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Novos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque Novos Estados', 'PARQUE NOVOS ESTADOS', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Novos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Estrela Park', 'RESIDENCIAL ESTRELA PARK', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Novos Estados' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Fé', 'SANTA FE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Polon', 'VILA POLON', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Altos da Afonso Pena', 'ALTOS DA AFONSO PENA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Santa Fé' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Veraneio', 'VERANEIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Veraneio', 'JARDIM VERANEIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Parque dos Poderes (Setor Administrativo)', 'PARQUE DOS PODERES SETOR ADMINISTRATIVO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Alphaville (I, II, III, IV)', 'RESIDENCIAL ALPHAVILLE I II III IV', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Coronel Antonino', 'CORONEL ANTONINO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Coronel Antonino', 'VILA CORONEL ANTONINO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Estrela do Sul', 'ESTRELA DO SUL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Rica', 'VILA RICA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'José Abrão', 'JOSE ABRAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Conjunto Habitacional José Abrão', 'CONJUNTO HABITACIONAL JOSE ABRAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Luzia', 'SANTA LUZIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Mata do Segredo', 'MATA DO SEGREDO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Segredo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Presidente', 'JARDIM PRESIDENTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Segredo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Residencial Parati (fração)', 'RESIDENCIAL PARATI FRACAO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Segredo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Campo Belo', 'CAMPO BELO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Mata do Segredo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Monte Castelo', 'MONTE CASTELO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Castelo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Monte Castelo', 'VILA MONTE CASTELO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Castelo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Segredo', 'SEGREDO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Castelo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Nasser (parte)', 'VILA NASSER PARTE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Monte Castelo' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nasser', 'NASSER', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Nasser', 'VILA NASSER', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Paradiso', 'JARDIM PARADISO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Siriema', 'SIRIEMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Santa Carmen', 'SANTA CARMEN', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Nova Lima', 'NOVA LIMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Nova Lima', 'JARDIM NOVA LIMA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Anache', 'JARDIM ANACHE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Columbia', 'JARDIM COLUMBIA', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Campo Belo', 'JARDIM CAMPO BELO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Tarsila do Amaral', 'TARSILA DO AMARAL', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Seminário', 'SEMINARIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Jardim Seminário', 'JARDIM SEMINARIO', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Marli', 'VILA MARLI', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, 'Vila Dedé', 'VILA DEDE', 'oficial', 100
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'oficial',
  confianca = 100;

