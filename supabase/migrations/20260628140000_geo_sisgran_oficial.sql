-- Base oficial SISGRAN CG — 86 bairros, 896 parcelamentos na planilha
-- Gerado por scripts/generate-geo-sisgran-seed.mjs

-- Desativa bairros que saíram da lista oficial
UPDATE public.geo_bairros SET ativo = false
WHERE bairro_oficial NOT IN ('Aero Rancho', 'Agrícola Rizolândia', 'Alves Pereira', 'Amambaí', 'América', 'Assentamento Conquista', 'Autonomista', 'Bandeirantes', 'Batistão', 'Bela Vista', 'Cabreúva', 'Caiçara', 'Caiobá', 'Carandá', 'Carlota', 'Carvalho', 'Centenário', 'Centro', 'Centro Oeste', 'Chácara Cachoeira', 'Chácara das Mansões', 'Chácara das Mansões II', 'Chácara dos Poderes', 'Chácara Imbirussu', 'Coophavila II', 'Coronel Antonino', 'Cruzeiro', 'Dr. Albuquerque', 'Estrela Dalva', 'Glória', 'Guanandi', 'Itanhangá', 'Jacy', 'Jardim dos Estados', 'Jardim Paulista', 'Jockey Club', 'José Abrão', 'Lageado', 'Leblon', 'Los Angeles', 'Margarida', 'Maria Aparecida Pedrossian', 'Mata do Jacinto', 'Mata do Segredo', 'Monte Castelo', 'Monte Líbano', 'Moreninha', 'Nasser', 'Noroeste', 'Nova Campo Grande', 'Nova Lima', 'Novos Estados', 'Núcleo Industrial', 'Panamá', 'Parati', 'Parque Jardim Atlântico', 'Pioneiros', 'Piratininga', 'Planalto', 'Popular', 'Rita Vieira', 'Santa Cruz do Pontal', 'Santa Fé', 'Santo Amaro', 'Santo Antônio', 'São Bento', 'São Conrado', 'São Francisco', 'São Lourenço', 'Seminário', 'Sítio Santa Maria', 'Sítios Atlântico', 'Sítios de Recreio Itaim', 'Sítios Moradia do Sol', 'Sobrinho', 'Taquarussu', 'Tarumã', 'Taveirópolis', 'Terras do Golfe', 'Tijuca', 'Tiradentes', 'Tv Morena', 'União', 'Universitário', 'Veraneio', 'Vilasboas');

INSERT INTO public.geo_bairros (bairro_oficial, regiao_urbana) VALUES
  ('Aero Rancho', 'Anhanduizinho'),
  ('Agrícola Rizolândia', 'Rural'),
  ('Alves Pereira', 'Anhanduizinho'),
  ('Amambaí', 'Centro'),
  ('América', 'Anhanduizinho'),
  ('Assentamento Conquista', 'Rural'),
  ('Autonomista', 'Prosa'),
  ('Bandeirantes', 'Lagoa'),
  ('Batistão', 'Lagoa'),
  ('Bela Vista', 'Centro'),
  ('Cabreúva', 'Centro'),
  ('Caiçara', 'Lagoa'),
  ('Caiobá', 'Lagoa'),
  ('Carandá', 'Prosa'),
  ('Carlota', 'Bandeira'),
  ('Carvalho', 'Centro'),
  ('Centenário', 'Anhanduizinho'),
  ('Centro', 'Centro'),
  ('Centro Oeste', 'Anhanduizinho'),
  ('Chácara Cachoeira', 'Prosa'),
  ('Chácara das Mansões', 'Rural'),
  ('Chácara das Mansões II', 'Rural'),
  ('Chácara dos Poderes', 'Prosa'),
  ('Chácara Imbirussu', 'Rural'),
  ('Coophavila II', 'Lagoa'),
  ('Coronel Antonino', 'Segredo'),
  ('Cruzeiro', 'Centro'),
  ('Dr. Albuquerque', 'Bandeira'),
  ('Estrela Dalva', 'Prosa'),
  ('Glória', 'Centro'),
  ('Guanandi', 'Anhanduizinho'),
  ('Itanhangá', 'Centro'),
  ('Jacy', 'Anhanduizinho'),
  ('Jardim dos Estados', 'Centro'),
  ('Jardim Paulista', 'Bandeira'),
  ('Jockey Club', 'Anhanduizinho'),
  ('José Abrão', 'Segredo'),
  ('Lageado', 'Anhanduizinho'),
  ('Leblon', 'Lagoa'),
  ('Los Angeles', 'Anhanduizinho'),
  ('Margarida', 'Prosa'),
  ('Maria Aparecida Pedrossian', 'Bandeira'),
  ('Mata do Jacinto', 'Prosa'),
  ('Mata do Segredo', 'Segredo'),
  ('Monte Castelo', 'Segredo'),
  ('Monte Líbano', 'Centro'),
  ('Moreninha', 'Bandeira'),
  ('Nasser', 'Segredo'),
  ('Noroeste', 'Prosa'),
  ('Nova Campo Grande', 'Imbirussu'),
  ('Nova Lima', 'Segredo'),
  ('Novos Estados', 'Prosa'),
  ('Núcleo Industrial', 'Imbirussu'),
  ('Panamá', 'Imbirussu'),
  ('Parati', 'Anhanduizinho'),
  ('Parque Jardim Atlântico', 'Rural'),
  ('Pioneiros', 'Anhanduizinho'),
  ('Piratininga', 'Anhanduizinho'),
  ('Planalto', 'Centro'),
  ('Popular', 'Imbirussu'),
  ('Rita Vieira', 'Bandeira'),
  ('Santa Cruz do Pontal', 'Rural'),
  ('Santa Fé', 'Prosa'),
  ('Santo Amaro', 'Imbirussu'),
  ('Santo Antônio', 'Imbirussu'),
  ('São Bento', 'Centro'),
  ('São Conrado', 'Lagoa'),
  ('São Francisco', 'Centro'),
  ('São Lourenço', 'Bandeira'),
  ('Seminário', 'Segredo'),
  ('Sítio Santa Maria', 'Rural'),
  ('Sítios Atlântico', 'Rural'),
  ('Sítios de Recreio Itaim', 'Rural'),
  ('Sítios Moradia do Sol', 'Rural'),
  ('Sobrinho', 'Imbirussu'),
  ('Taquarussu', 'Anhanduizinho'),
  ('Tarumã', 'Lagoa'),
  ('Taveirópolis', 'Lagoa'),
  ('Terras do Golfe', 'Rural'),
  ('Tijuca', 'Lagoa'),
  ('Tiradentes', 'Bandeira'),
  ('Tv Morena', 'Bandeira'),
  ('União', 'Lagoa'),
  ('Universitário', 'Bandeira'),
  ('Veraneio', 'Prosa'),
  ('Vilasboas', 'Bandeira')
ON CONFLICT (bairro_oficial) DO UPDATE SET
  regiao_urbana = EXCLUDED.regiao_urbana,
  ativo = true;

-- Recria parcelamentos conforme SISGRAN
UPDATE public.geo_parcelamentos SET ativo = false
WHERE bairro_id IN (SELECT id FROM public.geo_bairros WHERE ativo = true);

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('AERO RANCHO'), ('GRANJA SÃO LUIZ - 2ª SEÇÃO - PARTE'), ('GUANANDI II'), ('JARDIM DAS HORTÊNSIAS I'), ('JARDIM DAS HORTÊNSIAS II'), ('JARDIM DAS HORTÊNSIAS III'), ('NÚCLEO HABITACIONAL AERO RANCHO'), ('NÚCLEO HABITACIONAL AERO RANCHO II'), ('NÚCLEO HABITACIONAL AERO RANCHO III'), ('NÚCLEO HABITACIONAL AERO RANCHO IV'), ('NÚCLEO HABITACIONAL AERO RANCHO V')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Aero Rancho' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('AGRÍCOLA RIZOLÂNDIA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Agrícola Rizolândia' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CIDADE NOVA'), ('JARDIM COLIBRI'), ('JARDIM COLIBRI II'), ('JARDIM MACAPÁ'), ('JARDIM MONUMENTO'), ('JARDIM NASHVILLE'), ('LOTEAMENTO MUNICIPAL ALAN SOARES'), ('NÚCLEO HABITACIONAL UNIVERSITÁRIAS'), ('PARQUE DO TRABALHADOR'), ('PORTO SEGURO'), ('RESIDENCIAL ILHÉUS'), ('RESIDENCIAL JOÃO SCARANO'), ('UNIVERSITÁRIO - SEÇÃO D'), ('VILA ALVES PEREIRA'), ('VILA ANTUNES'), ('VILA CLÉLIA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Alves Pereira' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('AMAMBAÍ'), ('CONJUNTO RESIDENCIAL SARGENTO AMARAL'), ('VILA AURORA'), ('VILA BARÃO DO RIO BRANCO'), ('VILA CIDADE - PARTE'), ('VILA FLORESTA'), ('VILA GUENKA'), ('VILA MARACAJU'), ('VILA OLGA'), ('VILA ORPHEU BAÍS'), ('VILA PERSEVERANÇA'), ('VILA PORTÃO DE FERRO'), ('VILA SANTO ANTÔNIO'), ('VILA SÃO VICENTE'), ('VILA WARDE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Amambaí' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('VILA JARDIM AMÉRICA'), ('VILA PROGRESSO - PARTE'), ('VILA VALPARAÍSO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'América' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ASSENTAMENTO CONQUISTA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Assentamento Conquista' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('COOPHABANCO'), ('JARDIM AUTONOMISTA'), ('JARDIM AUTONOMISTA II'), ('JARDIM AUTONOMISTA III'), ('JARDIM GIOCONDO ORSI'), ('JARDIM GIOCONDO ORSI II'), ('JARDIM TAQUARI'), ('JARDIM VITRINE'), ('PETIT PARK'), ('VILA BOA ESPERANÇA - PARTE'), ('VILA CACIQUE'), ('VILA CRUZEIRO DO SUL'), ('VILA MONTE CARLO'), ('VILA ORSI'), ('VILA PAGÉ'), ('VILA RICA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Autonomista' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('COOPHAVILA'), ('ESTEBAN CORNELAS - PARTE'), ('VILA BANDEIRANTES'), ('VILA JUREMA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Bandeirantes' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CONJUNTO RESIDENCIAL JARDIM SERRA AZUL'), ('JARDIM BATISTÃO'), ('JARDIM LAGOA BELA'), ('JARDIM MATO GROSSO'), ('JARDIM VILLA LOBOS'), ('JARDIM VILLA LOBOS II'), ('LAGOA PARK'), ('SÃO JORGE DA LAGOA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Batistão' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CHÁCARA BOA VISTA'), ('CHÁCARA VENDAS'), ('JARDIM NOVA ERA'), ('JARDIM SANTA CATARINA'), ('MIGUEL COUTO - PARTE'), ('RESIDENCIAL VILLAGE'), ('VILA ANTÔNIO VENDAS - PARTE'), ('VILA COSTA LIMA'), ('VILA DI PARMA'), ('VILA JARDIM ALEGRE - PARTE'), ('VILA JARDIM BELA VISTA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Bela Vista' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('PARQUE RESIDENCIAL CABREÚVA'), ('VILA CIDADE - PARTE'), ('VILA ESPLANADA - 2ª SEÇÃO'), ('VILA FELICIANA CAROLINA - PARTE'), ('VILA GUARANI'), ('VILA INDEPENDÊNCIA'), ('VILA MARISA'), ('VILA SANTA ROSA - PARTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Cabreúva' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CAIÇARA'), ('JARDIM MARINGÁ'), ('VILA DOS MARIMBÁS'), ('VILA JARDIM ANAHY'), ('VILA JARDIM ANAHY - 2ª SEÇÃO'), ('VILA JARDIM LEBLON - PARTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Caiçara' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('BELA LAGUNA'), ('EPARQUE CAMPO GRANDE'), ('JARDIM RANCHO ALEGRE I'), ('JARDIM RANCHO ALEGRE II'), ('JARDIM RANCHO ALEGRE III'), ('JARDIM RANCHO ALEGRE IV'), ('PORTAL CAIOBÁ'), ('PORTAL CAIOBÁ II'), ('RESIDENCIAL JOÃO ALBERTO AMORIM DOS SANTOS'), ('RIVIEIRA PARK'), ('VILA FERNANDA'), ('VILA NATHÁLIA'), ('VILLAGIO RIVIERA'), ('VILLÁGIO VITÓRIA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Caiobá' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CARANDÁ BOSQUE I'), ('CARANDÁ BOSQUE II - PARTE'), ('CARANDÁ BOSQUE III'), ('COPACABANA'), ('GOLDEN GATE PARK'), ('LOTEAMENTO MUNICIPAL MÁRIO DE ANDRADE'), ('PORTAL DE ITAYARA'), ('RESIDENCIAL ITACOLOMI'), ('RESIDENCIAL TAYAMÃ PARK'), ('RESIDENCIAL VIA PARK'), ('RESIDENCIAL VIA PARK ITÁLIA'), ('TROPICAL PARK'), ('VILA DO POLONÊS'), ('VILA NASCENTE'), ('VIVENDAS DO BOSQUE - PARTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Carandá' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM ITAPEMA - PARTE'), ('VILA CARLOTA - PARTE'), ('VILA DR. ALBUQUERQUE - PARTE'), ('VILA IEDA'), ('VILA MORUMBI - SEÇÃO A - PARTE'), ('VILA PORTINHO FREDERICO PACHE - PARTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Carlota' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('VILA AMERICANA'), ('VILA CARVALHO'), ('VILA CARVALHO BAÍS'), ('VILA NOSSA SENHORA DE LOURDES'), ('VILA OLIVEIRA'), ('VILA QUITO'), ('VILA SANTA LUÍZA'), ('VILA SANTA MARIA'), ('VILA SÃO JOSÉ'), ('VILA SÃO RAFAEL')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Carvalho' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('DESMEMBRAMENTO CARLINDA PEREIRA CONTAR'), ('GRANJA SÃO LUIZ - 1ª SEÇÃO'), ('GRANJA SAO LUIZ - 2ª SEÇÃO - PARTE'), ('JARDIM CENTENÁRIO'), ('JARDIM DAS PRINCESAS I'), ('JARDIM DAS PRINCESAS II'), ('JARDIM ENSEADA DOS PÁSSAROS'), ('JARDIM MANAÍRA'), ('JARDIM MONTE ALEGRE'), ('JARDIM MONTEREY'), ('JARDIM PÊNFIGO'), ('JARDIM RADIALISTA'), ('PARQUE RESIDENCIAL IRACY COELHO NETTO'), ('PARQUE RESIDENCIAL IRACY COELHO NETTO II'), ('PARQUE RESIDENCIAL IRACY COELHO NETTO III'), ('RESIDENCIAL CEDRINHO'), ('RESIDENCIAL OURO PRETO'), ('RESIDENCIAL VILA BELA'), ('VILA AIMORÉ'), ('VILA AIMORÉ II'), ('VILA AMAPÁ'), ('VILA ÁUREA'), ('VILA NOGUEIRA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Centenário' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('VILA ALTA'), ('VILA AMÉRICA'), ('VILA BARTÍRIA'), ('VILA CIDADE - PARTE'), ('VILA CLEMENTINA'), ('VILA GENERAL WOLGRAND'), ('VILA ILGENFRITZ'), ('VILA JARDIM ACLIMAÇÃO - PARTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Centro' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM BÁLSAMO'), ('JARDIM BÁLSAMO II'), ('JARDIM BÁLSAMO III'), ('JARDIM CAMPO NOBRE'), ('JARDIM CANGURU'), ('JARDIM CENTRO OESTE'), ('JARDIM DAS MACAÚBAS'), ('JARDIM DAS MENINAS'), ('JARDIM MARAJOARA'), ('JARDIM MÁRIO COVAS'), ('JARDIM PARIS'), ('JARDIM PAULO COELHO MACHADO'), ('LOTEAMENTO MUNICIPAL BRANDÃO'), ('PARQUE NOVO SÉCULO'), ('PARTE DA CHÁCARA LAGEADO'), ('RESIDENCIAL RAMEZ TEBET'), ('VARANDAS DO CAMPO'), ('VEREDAS DO LAGEADO'), ('WASHINGTON SAITO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Centro Oeste' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ALTOS DA AFONSO PENA'), ('ALTOS DA MATA'), ('CACHOEIRINHA - PARTE'), ('CHÁCARA CACHOEIRA - PARTE'), ('CHÁCARA CACHOEIRA II'), ('CIDADE JARDIM'), ('JARDIM UMUARAMA'), ('MIGUEL COUTO - 2ª SEÇÃO'), ('MIGUEL COUTO - 3ª SEÇÃO'), ('MIGUEL COUTO - PARTE'), ('NAHIMA PARK'), ('RESIDENCIAL JATIUKA PARK'), ('SAN MARINO PARK'), ('VILA MANOEL DA COSTA LIMA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Chácara Cachoeira' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CHÁCARA DAS MANSÕES')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Chácara das Mansões' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CHÁCARA DAS MANSÕES II')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Chácara das Mansões II' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CHÁCARA DOS PODERES'), ('JARDIM CABRAL'), ('JARDIM PINHEIROS'), ('JARDIM VERANEIO - PARTE'), ('LIEU UNIQUE'), ('RIVIERA HOME CLUBE'), ('VILA RAQUEL'), ('VILA SÔNIA'), ('VILA TELMA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Chácara dos Poderes' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CHÁCARA IMBIRUSSU')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Chácara Imbirussu' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('COOPHAVILA II'), ('JARDIM OURO VERDE - 1ª SEÇÃO'), ('JARDIM OURO VERDE - 2ª SEÇÃO'), ('JARDIM VILA KELLEM'), ('VILA GAÚCHA'), ('VILA KELLEM - 2ª SEÇÃO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Coophavila II' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ARY ABUSSAFI DE LIMA'), ('CONJUNTO RESIDENCIAL ESTRELA DO SUL'), ('CONJUNTO RESIDENCIAL NOVA OLINDA'), ('CORONEL ANTONINO - PARTE'), ('ELDORADO'), ('GREGÓRIO CORRÊA'), ('GUANABARA'), ('JARDIM BARCELONA'), ('JARDIM MIRASOL'), ('JARDIM TALISMÃ'), ('LOTEAMENTO MUNICIPAL JARDIM CAMPO VERDE'), ('LOTEAMENTO MUNICIPAL NACIONAL'), ('LOTEAMENTO MUNICIPAL RAÍZES'), ('LOTEAMENTO MUNICIPAL RIO DE JANEIRO'), ('MORADA DO SOSSEGO'), ('MORADA DO SOSSEGO II'), ('MORADA VERDE'), ('NÚCLEO BECO DA LIBERDADE'), ('NÚCLEO GUATAMBU'), ('PARQUE IZABEL GARDENS'), ('RECANTO PANTANEIRO'), ('RESIDENCIAL ATLÂNTICO SUL'), ('VILA CALIFÓRNIA'), ('VILA JARDIM IMPERIAL'), ('VILA TRIÂNGULO'), ('VILLA RAVENNA'), ('VILLA RAVENNA II')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Coronel Antonino' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CLUB CAMPESTRE YPÊ'), ('CONJUNTO RESIDENCIAL MONTE CASTELO'), ('COOPHABAN'), ('CORONEL ANTONINO - PARTE'), ('CRUZEIRO'), ('JARDIM BRASIL - PARTE'), ('MONTE CASTELO'), ('MONTE CASTELO - SETOR 3 - PARTE'), ('NOSSA SENHORA DE FÁTIMA - PARTE'), ('VILA CÉLIA'), ('VILA GOMES'), ('VILA MARMAN'), ('VILA NOVA ALVORADA'), ('VILA ROSA'), ('VILA SILVIA'), ('VILA SILVIA - 2ª SEÇÃO'), ('VILA SUÍÇA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Cruzeiro' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('VILA DR. ALBUQUERQUE - PARTE'), ('VILA MACIEL - PARTE'), ('VILA OLINDA'), ('VILA PROGRESSO - 3ª SEÇÃO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Dr. Albuquerque' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CONJUNTO HABITACIONAL JARDIM ESTRELA DALVA I'), ('JARDIM ESTRELA DALVA II'), ('JARDIM ESTRELA DALVA III'), ('TAQUARAL BOSQUE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Estrela Dalva' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('VILA CASTELO'), ('VILA EVA'), ('VILA FORTUNA'), ('VILA GASPAR'), ('VILA GLÓRIA'), ('VILA JARDIM ALVORADA'), ('VILA LIBERDADE'), ('VILA ORIENTE'), ('VILA ORNELAS'), ('VILA ORNELAS - SEÇÃO B'), ('VILA SANTA DOROTHÉA'), ('VILA SANTA FILOMENA'), ('VILA SÃO MIGUEL'), ('VILA SOL NASCENTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Glória' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('GUANANDI'), ('NÚCLEO DONA NETA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Guanandi' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('DESMEMBRAMENTO GLAUCOS DA COSTA MARQUES'), ('ITANHANGÁ PARK'), ('JARDIM PIRACICABA'), ('JARDIM VISTA ALEGRE'), ('VILA DR. JOÃO ROSA'), ('VILA GATÃO'), ('VILA JOSELITO'), ('VILA REZENDE'), ('VILA ROSA PIRES')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Itanhangá' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM JACY'), ('VILA NOVA BANDEIRANTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Jacy' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CACHOEIRA'), ('CACHOEIRINHA - PARTE'), ('CHÁCARA CACHOEIRA - PARTE'), ('CHÁCARA DOS COQUEIROS'), ('DESMEMBRAMENTO CLARA GOLDMAN'), ('DESMEMBRAMENTO LAUDELINA MACHADO DOS SANTOS'), ('DESMEMBRAMENTO VILA MANDETA'), ('JARDIM SETE DE SETEMBRO'), ('VILA ABDO'), ('VILA BERNARDO GOLDMAN'), ('VILA CAMPO DE MARTE'), ('VILA DA SAÚDE'), ('VILA ESPORTIVA'), ('VILA GUARACIABA'), ('VILA ISES'), ('VILA JARDIM ACLIMAÇÃO - PARTE'), ('VILA JARDIM DOS ESTADOS'), ('VILA LIA'), ('VILA MANDETA'), ('VILA MARIANA'), ('VILA ONZE'), ('VILA PARAÍSO'), ('VILA PARAÍSO SUPLEMENTO'), ('VILA PAULISTANA'), ('VILA SANT'' ANA'), ('VILA SANTA ODETE'), ('VILA SANTÉRIO'), ('VILA SANTOS GOMES - PARTE'), ('VILA SÃO ELIAS'), ('VILA SÃO GABRIEL'), ('VILA SÃO JORGE'), ('VILA SUBURBANA'), ('VILA TUPACERETAN'), ('VILA XV DE NOVEMBRO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Jardim dos Estados' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM PAULISTA - PARTE'), ('PARANAENSE - PARTE'), ('VILA PROGRESSO - 2ª SEÇÃO'), ('VILA PROGRESSO - PARTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Jardim Paulista' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM JOCKEY CLUB'), ('JARDIM MARCOS ROBERTO'), ('VILA BOM JESUS'), ('VILA CELINA'), ('VILA SANTA AMÉLIA BAÍS')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Jockey Club' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM DAS PAINEIRAS'), ('JARDIM DAS VIRTUDES - PARTE'), ('MANOEL TAVEIRA - PARTE'), ('NÚCLEO HABITACIONAL JOSÉ ABRÃO'), ('PARQUE DOS LARANJAIS - PARTE'), ('VILA OESTE - PARTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'José Abrão' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM COLORADO'), ('LOTEAMENTO MUNICIPAL DOM ANTÔNIO BARBOSA'), ('PARQUE DO LAGEADO'), ('PARQUE DO SOL'), ('PARQUE DOS SABIÁS'), ('RESIDENCIAL JOSÉ TERUEL FILHO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Lageado' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ALTO LEBLON'), ('BONJARDIM'), ('CONJUNTO HABITACIONAL BURITI'), ('COOPHAMAT'), ('DESMEMBRAMENTO SARGENTO FLÓRIO ALCEBÍADES BRANDÃO'), ('ESTEBAN CORNELAS - PARTE'), ('JARDIM ANTARCTICA'), ('JARDIM DA LAPA'), ('JARDIM EUROPA'), ('JARDIM TATIANA'), ('NÚCLEO HABITACIONAL BONANÇA'), ('VILA JARDIM LEBLON - 2ª SEÇÃO'), ('VILA JARDIM LEBLON - PARTE'), ('VILA JUSSARA'), ('VILA OSPAMPAS'), ('VILA OURO FINO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Leblon' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM LOS ANGELES'), ('JARDIM MORADA DO SOL'), ('JARDIM SUMATRA'), ('JARDIM UIRAPURU'), ('RESIDENCIAL TERRA MORENA'), ('VESPASIANO MARTINS')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Los Angeles' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM MARABÁ'), ('LOTEAMENTO MUNICIPAL GUAICURUS'), ('LOTEAMENTO MUNICIPAL JABURU'), ('LOTEAMENTO MUNICIPAL JOAQUIM EUZÉBIO'), ('LOTEAMENTO MUNICIPAL PAULO VI'), ('LOTEAMENTO MUNICIPAL VERDE BRASIL'), ('VILA CAROLINA'), ('VILA CATARINA'), ('VILA CATARINA II'), ('VILA LUCINDA'), ('VILA MARGARIDA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Margarida' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ITAPARICA'), ('JARDIM SAMAMBAIA'), ('NOVA VIVENDAS'), ('PANORAMA'), ('PARQUE RESIDENCIAL DAMHA'), ('PARQUE RESIDENCIAL DAMHA II'), ('PARQUE RESIDENCIAL DAMHA III'), ('PARQUE RESIDENCIAL DAMHA IV'), ('PARQUE RESIDENCIAL MARIA APARECIDA PEDROSSIAN'), ('RESIDENCIAL OITI'), ('VIVENDAS DO PARQUE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Maria Aparecida Pedrossian' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CARANDÁ BOSQUE II - PARTE'), ('CONJUNTO HABITACIONAL MATA DO JACINTO'), ('DESMEMBRAMENTO DA (FAVELA DO LIMÃO) PARTE DA QUADRA 65, LOTE A'), ('LOTEAMENTO MUNICIPAL CEASA'), ('LOTEAMENTO MUNICIPAL NAZARÉ'), ('MATA DO JACINTO'), ('RESIDENCIAL ABAETÉ'), ('SÓTER')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Mata do Jacinto' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ARNALDINO DA SILVA'), ('JARDIM CAMPO BELO'), ('JARDIM CAMPO NOVO'), ('JARDIM DAS CEREJEIRAS'), ('JARDIM NASCENTE DO SEGREDO'), ('JARDIM PRESIDENTE'), ('LOTEAMENTO MUNICIPAL CRISTALDO'), ('LOTEAMENTO MUNICIPAL SALINAS'), ('NORTH PARK'), ('RESIDENCIAL GAMA'), ('TREVISO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Mata do Segredo' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CAMPO DOURADO'), ('CENTER PARK'), ('COSTA VERDE'), ('JARDIM BOSQUE DE AVILAN'), ('JARDIM DAS CÁSSIAS'), ('JARDIM SÃO PAULO - PARTE'), ('MONTE CASTELO'), ('MONTE CASTELO SETOR 1'), ('MONTE CASTELO SETOR 1A'), ('PRAIA DA URCA'), ('RESIDENCIAL GABURA'), ('RESIDENCIAL INDAIÁ'), ('RESIDENCIAL OCTÁVIO PÉCORA'), ('RESIDENCIAL RESERVA MORENA'), ('RESIDENCIAL VALE DO SOL I'), ('RESIDENCIAL VALE DO SOL II'), ('RESIDENCIAL VALE DO SOL III'), ('VILA SÃO JOÃO BOSCO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Monte Castelo' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM MONTE LÍBANO'), ('VILA ANTÔNIO INÁCIO DE SOUZA'), ('VILA JARDIM DE ALLAH'), ('VILA SANTO ANDRÉ')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Monte Líbano' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CHÁCARA NOVO HORIZONTE'), ('JARDIM ÁGUA BRANCA'), ('JARDIM BELA ITÁLIA'), ('JARDIM DO CÓRREGO'), ('JARDIM GRAMADO'), ('JARDIM NOVA CAPITAL'), ('JARDIM NOVA JERUSALÉM'), ('JARDIM SANTA FELICIDADE'), ('JOSÉ MAKSOUD'), ('LOTEAMENTO MUNICIPAL BARREIRAS'), ('LOTEAMENTO MUNICIPAL RIBEIRA'), ('MORENINHA IV'), ('NOVA CONQUISTA'), ('NOVO BRASIL'), ('NÚCLEO HABITACIONAL MORENINHA I'), ('NÚCLEO HABITACIONAL MORENINHA II'), ('NÚCLEO HABITACIONAL MORENINHA III'), ('PARAÍSO DO LAGEADO'), ('POLO EMPRESARIAL SUL'), ('VILA CIDADE MORENA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Moreninha' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ÁGUA LIMPA PARK'), ('BOM RETIRO'), ('BOSQUE DA SAÚDE'), ('COOPHASUL'), ('DONA DEDÉ'), ('JARDIM ALTO SÃO FRANCISCO'), ('JARDIM DA MOOCA'), ('JARDIM DAS ACÁCIAS'), ('JARDIM FLUMINENSE'), ('JARDIM MONTE ALTO'), ('JARDIM PAQUETÁ'), ('JARDIM PARADISO'), ('JARDIM VENEZA'), ('LOTEAMENTO MUNICIPAL DR. MIGUEL VIEIRA FERREIRA'), ('MORADA DOS DEUSES'), ('NOSSA SENHORA DAS GRAÇAS'), ('PARQUE RESIDENCIAL AZALÉIA'), ('RESIDENCIAL ALTO TAMANDARÉ'), ('RESIDENCIAL CARAJÁS'), ('RESIDENCIAL MARIA NEVES'), ('RESIDENCIAL RECANTO DO CERRADO'), ('RESIDENCIAL TOLENTINO'), ('SANTA LUZIA'), ('SÃO CAETANO'), ('SETVILLAGE I'), ('SETVILLAGE II'), ('VILA COX'), ('VILA LILI'), ('VILA MARLI'), ('VILA NASSER'), ('VILA NASSER - 2ª SEÇÃO'), ('VILA NEUSA'), ('VILA NILZA - 1ª E 2ª SEÇÃO'), ('VILA NOSSA SENHORA APARECIDA'), ('VILA NOVO HORIZONTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('AGUADINHA'), ('JARDIM NOROESTE'), ('NOVA SERRANA'), ('RESIDENCIAL SHALOM'), ('SERRAVILLE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Noroeste' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM CARIOCA'), ('NOVA CAMPO GRANDE BLOCO 01'), ('NOVA CAMPO GRANDE BLOCO 02'), ('NOVA CAMPO GRANDE BLOCO 03'), ('NOVA CAMPO GRANDE BLOCO 04'), ('NOVA CAMPO GRANDE BLOCO 05'), ('NOVA CAMPO GRANDE BLOCO 06'), ('NOVA CAMPO GRANDE BLOCO 07'), ('NOVA CAMPO GRANDE BLOCO 08'), ('NOVA CAMPO GRANDE BLOCO 12 - PARTE'), ('RESIDENCIAL NELSON TRAD'), ('VILA ELIANE'), ('VILA ELIANE - 2ª SEÇÃO'), ('VILA SERRADINHO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Nova Campo Grande' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CORIOLANDO DA SILVA CORREA I'), ('CORIOLANDO DA SILVA CORREA II'), ('JARDIM ANACHE'), ('JARDIM COLUMBIA'), ('JARDIM VIDA NOVA'), ('JOSÉ PRATES'), ('JOSÉ TAVARES DO COUTO'), ('LOTEAMENTO MUNICIPAL PEREIRA BORGES'), ('MANDELA 1'), ('MANDELA 2'), ('MANDELA 3'), ('NOVA LIMA'), ('OSCAR SALAZAR MOURA DA CRUZ'), ('PARQUE IGUATEMI'), ('RESERVA SANTA INÊS'), ('TARSILA DO AMARAL'), ('VIDA NOVA II'), ('VIDA NOVA III'), ('VILLAGIO SANTA INÊS')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Nova Lima' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ALPHAVILLE CAMPO GRANDE'), ('ALPHAVILLE CAMPO GRANDE 3'), ('ALPHAVILLE CAMPO GRANDE 4'), ('CONJUNTO RESIDENCIAL NOVA BAHIA'), ('CONJUNTO RESIDENCIAL NOVO ALAGOAS'), ('CONJUNTO RESIDENCIAL NOVO AMAZONAS'), ('CONJUNTO RESIDENCIAL NOVO MARANHÃO'), ('CONJUNTO RESIDENCIAL NOVO MINAS GERAIS'), ('CONJUNTO RESIDENCIAL NOVO PARANÁ'), ('CONJUNTO RESIDENCIAL NOVO PERNAMBUCO'), ('CONJUNTO RESIDENCIAL NOVO RIO GRANDE DO SUL'), ('CONJUNTO RESIDENCIAL NOVO SÃO PAULO'), ('CONJUNTO RESIDENCIAL NOVO SERGIPE'), ('JARDIM JACARANDÁ'), ('JARDIM MONTEVIDEU'), ('POLO EMPRESARIAL NORTE'), ('TERRAS ALPHA CAMPO GRANDE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Novos Estados' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM INÁPOLIS'), ('MORADA IMPERIAL'), ('NÚCLEO INDUSTRIAL'), ('POLO EMPRESARIAL OESTE'), ('VILA ENTRONCAMENTO'), ('VILA MANOEL SECCO THOMÉ')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Núcleo Industrial' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ALTOS DO PANAMÁ'), ('BOSQUE DAS ARARAS'), ('JARDIM AROEIRA'), ('JARDIM DO ZÉ PEREIRA'), ('JARDIM MATHILDE'), ('JARDIM PANAMÁ'), ('JARDIM PANAMÁ II'), ('JARDIM PANAMÁ III'), ('JARDIM PANAMÁ IV'), ('JARDIM PANAMÁ V'), ('JARDIM PANAMÁ VI'), ('PARQUE RESIDENCIAL BELLINATE'), ('PORTAL DO PANAMÁ'), ('RECANTO DOS PÁSSAROS'), ('RESIDENCIAL ANA MARIA DO COUTO'), ('RESIDENCIAL BÚZIOS'), ('RESIDENCIAL PARQUE DOS BANCÁRIOS'), ('RESIDENCIAL SAGARANA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Panamá' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ALTO DA BOA VISTA'), ('CONJUNTO RESIDENCIAL JARDIM PARATI'), ('GRANJA BANDEIRA - PARTE'), ('PARATI II'), ('RESIDENCIAL JARDIM DAS NAÇÕES')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Parati' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('PARQUE JARDIM ATLÂNTICO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Parque Jardim Atlântico' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('COLINAS DE CAMPO GRANDE'), ('CONJUNTO HABITACIONAL JARDIM ANÁPOLIS I'), ('GRANJA BANDEIRA - PARTE'), ('JARDIM AGULHAS NEGRAS'), ('JARDIM BOTAFOGO'), ('JARDIM BOTÂNICO'), ('JARDIM BOTÂNICO II'), ('JARDIM COLONIAL'), ('JARDIM DAS MANSÕES UNIVERSITÁRIAS'), ('JARDIM JANE'), ('JARDIM MORENÃO'), ('JARDIM ROSELÂNDIA'), ('JARDIM RUBIÁCEA'), ('JARDIM SANTA ÚRSULA'), ('JARDIM VICENTINO'), ('PARQUE RESIDENCIAL LISBOA'), ('PORTO GALO'), ('RECANTO DAS ANDORINHAS'), ('RESIDENCIAL DO LAGO'), ('RESIDENCIAL GERALDO CORRÊA DA SILVA'), ('RESIDENCIAL JARDIM BOTAFOGO'), ('RESIDENCIAL JOANA D''ARC'), ('UNIVERSITÁRIO - SEÇÃO C'), ('VILA ADELINA'), ('VILA JARDIM PIONEIROS'), ('VILA MACIEL - PARTE'), ('VILA SANTA BRANCA'), ('VILA SANTA BRANCA - 2ª SEÇÃO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Pioneiros' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CONJUNTO PROMORAR'), ('JARDIM NHANHÁ'), ('JARDIM PIRATININGA'), ('NOVA ESPERANÇA'), ('VILA GETÚLIA BARBOSA'), ('VILA IPIRANGA'), ('VITTA BELLA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Piratininga' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM MONTE VERDE'), ('SKY RESIDENCE'), ('VILA ALTO SUMARÉ'), ('VILA BOA VISTA'), ('VILA CORUMBÁ'), ('VILA ESTEPHANIA'), ('VILA FELICIANA CAROLINA - PARTE'), ('VILA PLANALTO'), ('VILA SANTA ROSA - PARTE'), ('VILA SANTA TEREZA'), ('VILA SANTOS'), ('VILA SÃO MANOEL'), ('VILA SOARES - 1ª SEÇÃO'), ('VILA SOARES - 2ª SEÇÃO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Planalto' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('BOSQUE SANTA MÔNICA'), ('BOSQUE SANTA MÔNICA II'), ('JARDIM AEROPORTO'), ('JARDIM DAS REGINAS'), ('JARDIM ITÁLIA'), ('JARDIM PETRÓPOLIS - PARTE'), ('JARDIM SAYONARA'), ('LOTEAMENTO MUNICIPAL JARDIM PANTANAL'), ('LOTEAMENTO MUNICIPAL MACAÉ'), ('NOVA CAMPO GRANDE BLOCO 11'), ('NOVA CAMPO GRANDE BLOCO 12 - PARTE'), ('NOVO DIA'), ('PARAVÁ'), ('VILA ROMANA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Popular' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ALAMEDA DOS CASTELOS'), ('CHÁCARA JOSÉ ANTÔNIO PEREIRA'), ('COOPHARÁDIO'), ('JARDIM ÁGUAS VIVAS'), ('JARDIM AUXILIADORA - PARTE'), ('JARDIM ITAMARACÁ'), ('JARDIM LAGOA DOURADA'), ('JARDIM NOSSA SENHORA DO PERPÉTUO SOCORRO'), ('LOTEAMENTO MUNICIPAL JARDIM ANHANGUERA'), ('PARQUE JATOBÁ'), ('PARQUE RITA VIEIRA'), ('VILA DOM PEDRITO'), ('VILA MORUMBI - SEÇÃO B - PARTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Rita Vieira' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('SANTA CRUZ DO PONTAL')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Santa Cruz do Pontal' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CHÁCARA CACHOEIRA - PARTE'), ('COOPHAFÉ'), ('ROYAL PARK'), ('SANTA FÉ'), ('VILA BOA ESPERANÇA - PARTE'), ('VILA NOVA IPANEMA'), ('VILA SANTOS GOMES - PARTE'), ('VIVENDAS DO BOSQUE - PARTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Santa Fé' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('COOPHATRABALHO'), ('JARDIM CANADÁ'), ('JARDIM DAS VIRTUDES - PARTE'), ('JARDIM ITAPUÃ'), ('JARDIM MANDALA'), ('MANOEL TAVEIRA - PARTE'), ('PARQUE DOS LARANJAIS - PARTE'), ('RESIDENCIAL HUGO RODRIGUES'), ('RESIDENCIAL SÍRIO LIBANÊS I'), ('RESIDENCIAL SÍRIO LIBANÊS II'), ('SANTA CAMÉLIA'), ('VILA ALMEIDA - 1ª SEÇÃO'), ('VILA ALMEIDA - 2ª SEÇÃO'), ('VILA DR. JAIR GARCIA'), ('VILA JARDIM BEIJA FLOR'), ('VILA PALMIRA'), ('VILA SANTO AMARO'), ('VILA SÃO MARCOS')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Santo Amaro' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM IMÁ'), ('JARDIM IMÁ - 2ª SEÇÃO'), ('JARDIM PETRÓPOLIS - PARTE'), ('JARDIM VERA CRUZ'), ('LOTEAMENTO MUNICIPAL JAGUARIBE'), ('SANTO ANTÔNIO'), ('VILA BOSQUE DA SAUDADE'), ('VILA COUTINHO'), ('VILA DORISA'), ('VILA NOVA'), ('VILA SILVIA REGINA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Santo Antônio' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM GUARUJÁ'), ('JARDIM SÃO BENTO'), ('VILA GALVÃO'), ('VILA NOVA SÃO BENTO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'São Bento' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM SANTA EMÍLIA'), ('JARDIM SÃO CONRADO - PARTE'), ('LOTEAMENTO MUNICIPAL INTERPRAIA'), ('RESIDENCIAL AQUARIUS I'), ('RESIDENCIAL AQUARIUS II'), ('RESIDENCIAL FIGUEIRAS DO PARQUE'), ('VILA MAJOR JUARES')) AS v(parcelamento)
WHERE b.bairro_oficial = 'São Conrado' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CASCUDO'), ('COFERMAT'), ('DESMEMBRAMENTO SANZIRO KATAYAMA'), ('JARDIM BRASIL - PARTE'), ('JARDIM CIDADE'), ('JARDIM SÃO PAULO - PARTE'), ('MONTE CASTELO'), ('MONTE CASTELO - SETOR 3 - PARTE'), ('NOSSA SENHORA DE FÁTIMA - PARTE'), ('VILA ALTO DAS PAINEIRAS'), ('VILA ANFE'), ('VILA APRAZÍVEL'), ('VILA BENJAMIN'), ('VILA CAPRI'), ('VILA CRISTINA'), ('VILA ESPLANADA'), ('VILA HELENA'), ('VILA LÍDIA - PARTE'), ('VILA SANTA BÁRBARA'), ('VILA SÃO FRANCISCO'), ('VILA SÃO LUIZ'), ('VILA SÃO SEBASTIÃO'), ('VILA SÃO THOMÉ')) AS v(parcelamento)
WHERE b.bairro_oficial = 'São Francisco' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM IBIRAPUERA'), ('JARDIM SÃO LOURENÇO'), ('VILA ALMEIDA LIMA'), ('VILA ANTÔNIO VENDAS - PARTE'), ('VILA JARDIM ALEGRE - PARTE'), ('VILA ZOÉ')) AS v(parcelamento)
WHERE b.bairro_oficial = 'São Lourenço' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM ORACÍLIA'), ('JARDIM SEMINÁRIO'), ('JARDIM SEMINÁRIO II'), ('LAGOA DA CRUZ'), ('PORTAL DO GRAMADO'), ('RESIDENCIAL NOVO SEMINÁRIO'), ('VILA ANTONIETA'), ('VILA DALILA'), ('VILA JARDIM MARIA AMÉLIA'), ('VILA LEDA'), ('VILA LÍDIA - PARTE'), ('VILA NOSSA SENHORA DA CONCEIÇÃO'), ('VILA SANTA LÚCIA'), ('VILA SÃO BENEDITO'), ('VILA SÃO ROQUE'), ('VILA SARAIVA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Seminário' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('SÍTIO SANTA MARIA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Sítio Santa Maria' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('SÍTIOS ATLÂNTICO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Sítios Atlântico' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('SÍTIOS DE RECREIO ITAIM')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Sítios de Recreio Itaim' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('SÍTIOS MORADIA DO SOL')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Sítios Moradia do Sol' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('COOPERMAT - CONJUNTO RESIDENCIAL CIDADE MORENA'), ('COOPHACO'), ('JARDIM IPANEMA'), ('JARDIM LEONÍDIA'), ('LAR DO TRABALHADOR'), ('PAPA JOÃO PAULO II'), ('PARQUE DOS IPÊS'), ('PARQUE SÃO DOMINGOS'), ('RESIDENCIAL PARQUE DOS FLAMINGOS'), ('VILA ACRÓPOLIS'), ('VILA ALBA'), ('VILA ALBA - COOPHACO II'), ('VILA AVIAÇÃO'), ('VILA CINAMOMO'), ('VILA DUQUE DE CAXIAS'), ('VILA ESPANHOLA'), ('VILA NOSSA SENHORA AUXILIADORA'), ('VILA OESTE - PARTE'), ('VILA ROSALINA'), ('VILA SANTA RITA'), ('VILA SOBRINHO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Sobrinho' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('COHAFAMA'), ('JARDIM TAQUARUSSU'), ('VILA AFONSO PENA'), ('VILA AFONSO PENA JR.'), ('VILA ITAMARATI'), ('VILA SANTO AFONSO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Taquarussu' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('ARAPONGAS'), ('CONJUNTO RESIDENCIAL TARUMÃ'), ('JARDIM CORCOVADO'), ('JARDIM PORTAL DAS LARANJEIRAS'), ('JARDIM SOL POENTE'), ('JARDIM TARUMÃ'), ('VILA JANDAIA'), ('ZÉLIA GATTAI')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Tarumã' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('SANTOS DUMONT'), ('VILA BELO HORIZONTE'), ('VILA BELO HORIZONTE - 2ª SEÇÃO'), ('VILA TAVEIRÓPOLIS')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Taveirópolis' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('TERRAS DO GOLFE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Terras do Golfe' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM DOS BOGGI'), ('JARDIM SÃO CONRADO - PARTE'), ('JARDIM TIJUCA'), ('JARDIM TIJUCA II'), ('LOTEAMENTO MUNICIPAL JARDIM VERDES MARES'), ('RESIDENCIAL BARRA DA TIJUCA'), ('RESIDENCIAL BARRA DA TIJUCA II'), ('RESIDENCIAL CAMBARÁ'), ('RESIDENCIAL UBATUBA'), ('SÃO PEDRO'), ('VILA VILMA')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Tijuca' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('DESBARRANCADO - PARTE'), ('ESTRELA PARQUE'), ('JARDIM CRISTO REDENTOR'), ('JARDIM JERUSALÉM'), ('JARDIM SÃO JUDAS TADEU'), ('JARDIM VITÓRIA'), ('LOTEAMENTO INDÍGENA MARÇAL DE SOUZA'), ('LOTEAMENTO MUNICIPAL CAVAN'), ('LOTEAMENTO MUNICIPAL DALVA DE OLIVEIRA'), ('LOTEAMENTO MUNICIPAL DALVA DE OLIVEIRA II'), ('LOTEAMENTO MUNICIPAL NÚCLEO TIRADENTES'), ('PARQUE RESIDENCIAL ANHEMBI'), ('PARQUE RESIDENCIAL ARNALDO ESTEVÃO DE FIGUEIREDO'), ('PARQUE RESIDENCIAL ARNALDO ESTEVÃO DE FIGUEIREDO II'), ('PORTOBELLO'), ('REGINA'), ('RESIDENCIAL ITATIAIA'), ('RESIDENCIAL JARDIM FLAMBOYANT'), ('RESIDENCIAL JARDIM FLAMBOYANT II'), ('RESIDENCIAL NOVA TIRADENTES'), ('TIRADENTES'), ('TIRADENTES - 2ª SEÇÃO'), ('VILA JARDIM SÃO BERNARDO')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Tiradentes' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('JARDIM PAULISTA - PARTE'), ('JARDIM TV MORENA'), ('PARANAENSE - PARTE'), ('VILA CARLOTA - PARTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Tv Morena' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('PARQUE RESIDENCIAL DOS GIRASSÓIS'), ('PARQUE RESIDENCIAL UNIÃO'), ('PARQUE RESIDENCIAL UNIÃO II'), ('RESIDENCIAL FLORES'), ('RESIDENCIAL OLIVEIRA I'), ('RESIDENCIAL OLIVEIRA II'), ('RESIDENCIAL OLIVEIRA III')) AS v(parcelamento)
WHERE b.bairro_oficial = 'União' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('CONJUNTO RESIDENCIAL RECANTO DOS ROUXINÓIS'), ('ECO-MARACÁ'), ('EDSON BRITO GARCIA'), ('JARDIM AMETISTA'), ('JARDIM ANTARES'), ('JARDIM CAMPINA VERDE'), ('JARDIM CAMPO ALTO'), ('JARDIM CAMPO LIMPO'), ('JARDIM DAS PERDIZES'), ('JARDIM INDIANÁPOLIS'), ('JARDIM MOEMA'), ('JARDIM PACAEMBU'), ('JARDIM TROPICAL'), ('PEQUENA FLOR I'), ('RECANTO DAS PALMEIRAS'), ('RESIDENCIAL BETAVILLE'), ('RESIDENCIAL TERRA DOS PEQUIS'), ('SITIOCAS ALVORADA'), ('UNIVERSITÁRIO - SEÇÃO A'), ('UNIVERSITÁRIO - SEÇÃO B'), ('VILA CONCÓRDIA'), ('VILA JULIETA'), ('VILA SANTO EUGÊNIO'), ('VOLPE'), ('VOLPE II')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Universitário' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('BEIRUTE RESIDENCE PARK'), ('BOSQUE DA ESPERANÇA'), ('BOSQUE DA ESPERANÇA II'), ('BOSQUE DO CARVALHO'), ('DESBARRANCADO - PARTE'), ('JARDIM ARCO-ÍRIS'), ('JARDIM TAYANA'), ('JARDIM VERANEIO - PARTE'), ('QUINTAS DO RIO VERMELHO'), ('VILA ABDALLA'), ('VILA DANÚBIO AZUL'), ('VILA FUTURISTA'), ('VIVENDAS DO BOSQUE - PARTE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Veraneio' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, v.parcelamento
FROM public.geo_bairros b
CROSS JOIN (VALUES ('AMANTINI RESIDENCE'), ('INDIANA PARK'), ('JARDIM AUXILIADORA - PARTE'), ('JARDIM ITAPEMA - PARTE'), ('JARDIM MANSUR'), ('PARQUE DALLAS'), ('RESIDENCIAL DELFOS'), ('RESIDENCIAL VILA OLÍMPICA'), ('VILA JARDIM ALEGRE - PARTE'), ('VILA PORTINHO FREDERICO PACHE - PARTE'), ('VILA VILASBOAS'), ('VILLAS PARK RESIDENCE')) AS v(parcelamento)
WHERE b.bairro_oficial = 'Vilasboas' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = v.parcelamento AND p.ativo = true
  );

-- Sinônimos oficiais SISGRAN (inclui nome sem "Seção" quando parcelamento tem seção)
DELETE FROM public.geo_sinonimos WHERE tipo_correspondencia IN ('oficial', 'sisgran');

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ('Aero Rancho', 'Aero Rancho', 'AERO RANCHO'),
  ('Agrícola Rizolândia', 'Agrícola Rizolândia', 'AGRICOLA RIZOLANDIA'),
  ('Nasser', 'ÁGUA LIMPA PARK', 'AGUA LIMPA PARK'),
  ('Noroeste', 'AGUADINHA', 'AGUADINHA'),
  ('Rita Vieira', 'ALAMEDA DOS CASTELOS', 'ALAMEDA DOS CASTELOS'),
  ('Novos Estados', 'ALPHAVILLE CAMPO GRANDE', 'ALPHAVILLE CAMPO GRANDE'),
  ('Parati', 'ALTO DA BOA VISTA', 'ALTO DA BOA VISTA'),
  ('Leblon', 'ALTO LEBLON', 'ALTO LEBLON'),
  ('Chácara Cachoeira', 'ALTOS DA AFONSO PENA', 'ALTOS DA AFONSO PENA'),
  ('Chácara Cachoeira', 'ALTOS DA MATA', 'ALTOS DA MATA'),
  ('Panamá', 'ALTOS DO PANAMÁ', 'ALTOS DO PANAMA'),
  ('Alves Pereira', 'Alves Pereira', 'ALVES PEREIRA'),
  ('Amambaí', 'Amambaí', 'AMAMBAI'),
  ('Vilasboas', 'AMANTINI RESIDENCE', 'AMANTINI RESIDENCE'),
  ('América', 'América', 'AMERICA'),
  ('Tarumã', 'ARAPONGAS', 'ARAPONGAS'),
  ('Mata do Segredo', 'ARNALDINO DA SILVA', 'ARNALDINO DA SILVA'),
  ('Coronel Antonino', 'ARY ABUSSAFI DE LIMA', 'ARY ABUSSAFI DE LIMA'),
  ('Assentamento Conquista', 'Assentamento Conquista', 'ASSENTAMENTO CONQUISTA'),
  ('Autonomista', 'Autonomista', 'AUTONOMISTA'),
  ('Bandeirantes', 'Bandeirantes', 'BANDEIRANTES'),
  ('Batistão', 'Batistão', 'BATISTAO'),
  ('Veraneio', 'BEIRUTE RESIDENCE PARK', 'BEIRUTE RESIDENCE PARK'),
  ('Caiobá', 'BELA LAGUNA', 'BELA LAGUNA'),
  ('Bela Vista', 'Bela Vista', 'BELA VISTA'),
  ('Nasser', 'BOM RETIRO', 'BOM RETIRO'),
  ('Leblon', 'BONJARDIM', 'BONJARDIM'),
  ('Veraneio', 'BOSQUE DA ESPERANÇA', 'BOSQUE DA ESPERANCA'),
  ('Nasser', 'BOSQUE DA SAÚDE', 'BOSQUE DA SAUDE'),
  ('Panamá', 'BOSQUE DAS ARARAS', 'BOSQUE DAS ARARAS'),
  ('Veraneio', 'BOSQUE DO CARVALHO', 'BOSQUE DO CARVALHO'),
  ('Popular', 'BOSQUE SANTA MÔNICA', 'BOSQUE SANTA MONICA'),
  ('Cabreúva', 'Cabreúva', 'CABREUVA'),
  ('Jardim dos Estados', 'CACHOEIRA', 'CACHOEIRA'),
  ('Chácara Cachoeira', 'CACHOEIRINHA - PARTE', 'CACHOEIRINHA'),
  ('Caiçara', 'Caiçara', 'CAICARA'),
  ('Caiobá', 'Caiobá', 'CAIOBA'),
  ('Monte Castelo', 'CAMPO DOURADO', 'CAMPO DOURADO'),
  ('Carandá', 'Carandá', 'CARANDA'),
  ('Carandá', 'CARANDÁ BOSQUE I', 'CARANDA BOSQUE'),
  ('Carandá', 'CARANDÁ BOSQUE II - PARTE', 'CARANDA BOSQUE II'),
  ('Carlota', 'Carlota', 'CARLOTA'),
  ('Carvalho', 'Carvalho', 'CARVALHO'),
  ('São Francisco', 'CASCUDO', 'CASCUDO'),
  ('Centenário', 'Centenário', 'CENTENARIO'),
  ('Monte Castelo', 'CENTER PARK', 'CENTER PARK'),
  ('Centro', 'Centro', 'CENTRO'),
  ('Centro Oeste', 'Centro Oeste', 'CENTRO OESTE'),
  ('Bela Vista', 'CHÁCARA BOA VISTA', 'CHACARA BOA VISTA'),
  ('Chácara Cachoeira', 'Chácara Cachoeira', 'CHACARA CACHOEIRA'),
  ('Chácara das Mansões', 'Chácara das Mansões', 'CHACARA DAS MANSOES'),
  ('Jardim dos Estados', 'CHÁCARA DOS COQUEIROS', 'CHACARA DOS COQUEIROS'),
  ('Chácara dos Poderes', 'Chácara dos Poderes', 'CHACARA DOS PODERES'),
  ('Chácara Imbirussu', 'Chácara Imbirussu', 'CHACARA IMBIRUSSU'),
  ('Rita Vieira', 'CHÁCARA JOSÉ ANTÔNIO PEREIRA', 'CHACARA JOSE ANTONIO PEREIRA'),
  ('Moreninha', 'CHÁCARA NOVO HORIZONTE', 'CHACARA NOVO HORIZONTE'),
  ('Bela Vista', 'CHÁCARA VENDAS', 'CHACARA VENDAS'),
  ('Chácara Cachoeira', 'CIDADE JARDIM', 'CIDADE JARDIM'),
  ('Alves Pereira', 'CIDADE NOVA', 'CIDADE NOVA'),
  ('Cruzeiro', 'CLUB CAMPESTRE YPÊ', 'CLUB CAMPESTRE YPE'),
  ('São Francisco', 'COFERMAT', 'COFERMAT'),
  ('Taquarussu', 'COHAFAMA', 'COHAFAMA'),
  ('Pioneiros', 'COLINAS DE CAMPO GRANDE', 'COLINAS DE CAMPO GRANDE'),
  ('Leblon', 'CONJUNTO HABITACIONAL BURITI', 'CONJUNTO HABITACIONAL BURITI'),
  ('Pioneiros', 'CONJUNTO HABITACIONAL JARDIM ANÁPOLIS I', 'CONJUNTO HABITACIONAL JARDIM ANAPOLIS'),
  ('Estrela Dalva', 'CONJUNTO HABITACIONAL JARDIM ESTRELA DALVA I', 'CONJUNTO HABITACIONAL JARDIM ESTRELA DALVA'),
  ('Mata do Jacinto', 'CONJUNTO HABITACIONAL MATA DO JACINTO', 'CONJUNTO HABITACIONAL MATA DO JACINTO'),
  ('Piratininga', 'CONJUNTO PROMORAR', 'CONJUNTO PROMORAR'),
  ('Coronel Antonino', 'CONJUNTO RESIDENCIAL ESTRELA DO SUL', 'CONJUNTO RESIDENCIAL ESTRELA DO SUL'),
  ('Parati', 'CONJUNTO RESIDENCIAL JARDIM PARATI', 'CONJUNTO RESIDENCIAL JARDIM PARATI'),
  ('Batistão', 'CONJUNTO RESIDENCIAL JARDIM SERRA AZUL', 'CONJUNTO RESIDENCIAL JARDIM SERRA AZUL'),
  ('Cruzeiro', 'CONJUNTO RESIDENCIAL MONTE CASTELO', 'CONJUNTO RESIDENCIAL MONTE CASTELO'),
  ('Novos Estados', 'CONJUNTO RESIDENCIAL NOVA BAHIA', 'CONJUNTO RESIDENCIAL NOVA BAHIA'),
  ('Coronel Antonino', 'CONJUNTO RESIDENCIAL NOVA OLINDA', 'CONJUNTO RESIDENCIAL NOVA OLINDA'),
  ('Novos Estados', 'CONJUNTO RESIDENCIAL NOVO ALAGOAS', 'CONJUNTO RESIDENCIAL NOVO ALAGOAS'),
  ('Novos Estados', 'CONJUNTO RESIDENCIAL NOVO AMAZONAS', 'CONJUNTO RESIDENCIAL NOVO AMAZONAS'),
  ('Novos Estados', 'CONJUNTO RESIDENCIAL NOVO MARANHÃO', 'CONJUNTO RESIDENCIAL NOVO MARANHAO'),
  ('Novos Estados', 'CONJUNTO RESIDENCIAL NOVO MINAS GERAIS', 'CONJUNTO RESIDENCIAL NOVO MINAS GERAIS'),
  ('Novos Estados', 'CONJUNTO RESIDENCIAL NOVO PARANÁ', 'CONJUNTO RESIDENCIAL NOVO PARANA'),
  ('Novos Estados', 'CONJUNTO RESIDENCIAL NOVO PERNAMBUCO', 'CONJUNTO RESIDENCIAL NOVO PERNAMBUCO')
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ('Novos Estados', 'CONJUNTO RESIDENCIAL NOVO RIO GRANDE DO SUL', 'CONJUNTO RESIDENCIAL NOVO RIO GRANDE DO SUL'),
  ('Novos Estados', 'CONJUNTO RESIDENCIAL NOVO SÃO PAULO', 'CONJUNTO RESIDENCIAL NOVO SAO PAULO'),
  ('Novos Estados', 'CONJUNTO RESIDENCIAL NOVO SERGIPE', 'CONJUNTO RESIDENCIAL NOVO SERGIPE'),
  ('Universitário', 'CONJUNTO RESIDENCIAL RECANTO DOS ROUXINÓIS', 'CONJUNTO RESIDENCIAL RECANTO DOS ROUXINOIS'),
  ('Amambaí', 'CONJUNTO RESIDENCIAL SARGENTO AMARAL', 'CONJUNTO RESIDENCIAL SARGENTO AMARAL'),
  ('Tarumã', 'CONJUNTO RESIDENCIAL TARUMÃ', 'CONJUNTO RESIDENCIAL TARUMA'),
  ('Sobrinho', 'COOPERMAT - CONJUNTO RESIDENCIAL CIDADE MORENA', 'COOPERMAT CONJUNTO RESIDENCIAL CIDADE MORENA'),
  ('Cruzeiro', 'COOPHABAN', 'COOPHABAN'),
  ('Autonomista', 'COOPHABANCO', 'COOPHABANCO'),
  ('Sobrinho', 'COOPHACO', 'COOPHACO'),
  ('Santa Fé', 'COOPHAFÉ', 'COOPHAFE'),
  ('Leblon', 'COOPHAMAT', 'COOPHAMAT'),
  ('Rita Vieira', 'COOPHARÁDIO', 'COOPHARADIO'),
  ('Nasser', 'COOPHASUL', 'COOPHASUL'),
  ('Santo Amaro', 'COOPHATRABALHO', 'COOPHATRABALHO'),
  ('Bandeirantes', 'COOPHAVILA', 'COOPHAVILA'),
  ('Carandá', 'COPACABANA', 'COPACABANA'),
  ('Nova Lima', 'CORIOLANDO DA SILVA CORREA I', 'CORIOLANDO DA SILVA CORREA'),
  ('Coronel Antonino', 'Coronel Antonino', 'CORONEL ANTONINO'),
  ('Monte Castelo', 'COSTA VERDE', 'COSTA VERDE'),
  ('Cruzeiro', 'Cruzeiro', 'CRUZEIRO'),
  ('Tiradentes', 'DESBARRANCADO - PARTE', 'DESBARRANCADO'),
  ('Centenário', 'DESMEMBRAMENTO CARLINDA PEREIRA CONTAR', 'DESMEMBRAMENTO CARLINDA PEREIRA CONTAR'),
  ('Jardim dos Estados', 'DESMEMBRAMENTO CLARA GOLDMAN', 'DESMEMBRAMENTO CLARA GOLDMAN'),
  ('Mata do Jacinto', 'DESMEMBRAMENTO DA (FAVELA DO LIMÃO) PARTE DA QUADRA 65, LOTE A', 'DESMEMBRAMENTO DA PARTE DA QUADRA 65 LOTEAMENTO A'),
  ('Itanhangá', 'DESMEMBRAMENTO GLAUCOS DA COSTA MARQUES', 'DESMEMBRAMENTO GLAUCOS DA COSTA MARQUES'),
  ('Jardim dos Estados', 'DESMEMBRAMENTO LAUDELINA MACHADO DOS SANTOS', 'DESMEMBRAMENTO LAUDELINA MACHADO DOS SANTOS'),
  ('São Francisco', 'DESMEMBRAMENTO SANZIRO KATAYAMA', 'DESMEMBRAMENTO SANZIRO KATAYAMA'),
  ('Leblon', 'DESMEMBRAMENTO SARGENTO FLÓRIO ALCEBÍADES BRANDÃO', 'DESMEMBRAMENTO SARGENTO FLORIO ALCEBIADES BRANDAO'),
  ('Jardim dos Estados', 'DESMEMBRAMENTO VILA MANDETA', 'DESMEMBRAMENTO VILA MANDETA'),
  ('Nasser', 'DONA DEDÉ', 'DONA DEDE'),
  ('Dr. Albuquerque', 'Dr. Albuquerque', 'DR ALBUQUERQUE'),
  ('Universitário', 'ECO-MARACÁ', 'ECO MARACA'),
  ('Universitário', 'EDSON BRITO GARCIA', 'EDSON BRITO GARCIA'),
  ('Coronel Antonino', 'ELDORADO', 'ELDORADO'),
  ('Caiobá', 'EPARQUE CAMPO GRANDE', 'EPARQUE CAMPO GRANDE'),
  ('Bandeirantes', 'ESTEBAN CORNELAS - PARTE', 'ESTEBAN CORNELAS'),
  ('Estrela Dalva', 'Estrela Dalva', 'ESTRELA DALVA'),
  ('Tiradentes', 'ESTRELA PARQUE', 'ESTRELA PARQUE'),
  ('Glória', 'Glória', 'GLORIA'),
  ('Carandá', 'GOLDEN GATE PARK', 'GOLDEN GATE PARK'),
  ('Parati', 'GRANJA BANDEIRA - PARTE', 'GRANJA BANDEIRA'),
  ('Aero Rancho', 'GRANJA SÃO LUIZ', 'GRANJA SAO LUIZ'),
  ('Centenário', 'GRANJA SÃO LUIZ - 1ª SEÇÃO', 'GRANJA SAO LUIZ 1 SECAO'),
  ('Aero Rancho', 'GRANJA SÃO LUIZ - 2ª SEÇÃO - PARTE', 'GRANJA SAO LUIZ 2 SECAO'),
  ('Coronel Antonino', 'GREGÓRIO CORRÊA', 'GREGORIO CORREA'),
  ('Coronel Antonino', 'GUANABARA', 'GUANABARA'),
  ('Aero Rancho', 'GUANANDI II', 'GUANANDI'),
  ('Vilasboas', 'INDIANA PARK', 'INDIANA PARK'),
  ('Itanhangá', 'Itanhangá', 'ITANHANGA'),
  ('Itanhangá', 'ITANHANGÁ PARK', 'ITANHANGA PARK'),
  ('Maria Aparecida Pedrossian', 'ITAPARICA', 'ITAPARICA'),
  ('Jacy', 'Jacy', 'JACY'),
  ('Popular', 'JARDIM AEROPORTO', 'JARDIM AEROPORTO'),
  ('Moreninha', 'JARDIM ÁGUA BRANCA', 'JARDIM AGUA BRANCA'),
  ('Rita Vieira', 'JARDIM ÁGUAS VIVAS', 'JARDIM AGUAS VIVAS'),
  ('Pioneiros', 'JARDIM AGULHAS NEGRAS', 'JARDIM AGULHAS NEGRAS'),
  ('Nasser', 'JARDIM ALTO SÃO FRANCISCO', 'JARDIM ALTO SAO FRANCISCO'),
  ('Universitário', 'JARDIM AMETISTA', 'JARDIM AMETISTA'),
  ('Nova Lima', 'JARDIM ANACHE', 'JARDIM ANACHE'),
  ('Leblon', 'JARDIM ANTARCTICA', 'JARDIM ANTARCTICA'),
  ('Universitário', 'JARDIM ANTARES', 'JARDIM ANTARES'),
  ('Veraneio', 'JARDIM ARCO-ÍRIS', 'JARDIM ARCO IRIS'),
  ('Panamá', 'JARDIM AROEIRA', 'JARDIM AROEIRA'),
  ('Autonomista', 'JARDIM AUTONOMISTA', 'JARDIM AUTONOMISTA'),
  ('Rita Vieira', 'JARDIM AUXILIADORA - PARTE', 'JARDIM AUXILIADORA'),
  ('Centro Oeste', 'JARDIM BÁLSAMO', 'JARDIM BALSAMO'),
  ('Coronel Antonino', 'JARDIM BARCELONA', 'JARDIM BARCELONA'),
  ('Batistão', 'JARDIM BATISTÃO', 'JARDIM BATISTAO'),
  ('Moreninha', 'JARDIM BELA ITÁLIA', 'JARDIM BELA ITALIA'),
  ('Monte Castelo', 'JARDIM BOSQUE DE AVILAN', 'JARDIM BOSQUE DE AVILAN'),
  ('Pioneiros', 'JARDIM BOTAFOGO', 'JARDIM BOTAFOGO'),
  ('Pioneiros', 'JARDIM BOTÂNICO', 'JARDIM BOTANICO'),
  ('Cruzeiro', 'JARDIM BRASIL - PARTE', 'JARDIM BRASIL'),
  ('Chácara dos Poderes', 'JARDIM CABRAL', 'JARDIM CABRAL'),
  ('Universitário', 'JARDIM CAMPINA VERDE', 'JARDIM CAMPINA VERDE'),
  ('Universitário', 'JARDIM CAMPO ALTO', 'JARDIM CAMPO ALTO'),
  ('Mata do Segredo', 'JARDIM CAMPO BELO', 'JARDIM CAMPO BELO'),
  ('Universitário', 'JARDIM CAMPO LIMPO', 'JARDIM CAMPO LIMPO'),
  ('Centro Oeste', 'JARDIM CAMPO NOBRE', 'JARDIM CAMPO NOBRE')
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ('Mata do Segredo', 'JARDIM CAMPO NOVO', 'JARDIM CAMPO NOVO'),
  ('Santo Amaro', 'JARDIM CANADÁ', 'JARDIM CANADA'),
  ('Centro Oeste', 'JARDIM CANGURU', 'JARDIM CANGURU'),
  ('Nova Campo Grande', 'JARDIM CARIOCA', 'JARDIM CARIOCA'),
  ('Centenário', 'JARDIM CENTENÁRIO', 'JARDIM CENTENARIO'),
  ('Centro Oeste', 'JARDIM CENTRO OESTE', 'JARDIM CENTRO OESTE'),
  ('São Francisco', 'JARDIM CIDADE', 'JARDIM CIDADE'),
  ('Alves Pereira', 'JARDIM COLIBRI', 'JARDIM COLIBRI'),
  ('Pioneiros', 'JARDIM COLONIAL', 'JARDIM COLONIAL'),
  ('Lageado', 'JARDIM COLORADO', 'JARDIM COLORADO'),
  ('Nova Lima', 'JARDIM COLUMBIA', 'JARDIM COLUMBIA'),
  ('Tarumã', 'JARDIM CORCOVADO', 'JARDIM CORCOVADO'),
  ('Tiradentes', 'JARDIM CRISTO REDENTOR', 'JARDIM CRISTO REDENTOR'),
  ('Leblon', 'JARDIM DA LAPA', 'JARDIM DA LAPA'),
  ('Nasser', 'JARDIM DA MOOCA', 'JARDIM DA MOOCA'),
  ('Nasser', 'JARDIM DAS ACÁCIAS', 'JARDIM DAS ACACIAS'),
  ('Monte Castelo', 'JARDIM DAS CÁSSIAS', 'JARDIM DAS CASSIAS'),
  ('Mata do Segredo', 'JARDIM DAS CEREJEIRAS', 'JARDIM DAS CEREJEIRAS'),
  ('Aero Rancho', 'JARDIM DAS HORTÊNSIAS I', 'JARDIM DAS HORTENSIAS'),
  ('Centro Oeste', 'JARDIM DAS MACAÚBAS', 'JARDIM DAS MACAUBAS'),
  ('Pioneiros', 'JARDIM DAS MANSÕES UNIVERSITÁRIAS', 'JARDIM DAS MANSOES UNIVERSITARIAS'),
  ('Centro Oeste', 'JARDIM DAS MENINAS', 'JARDIM DAS MENINAS'),
  ('José Abrão', 'JARDIM DAS PAINEIRAS', 'JARDIM DAS PAINEIRAS'),
  ('Universitário', 'JARDIM DAS PERDIZES', 'JARDIM DAS PERDIZES'),
  ('Centenário', 'JARDIM DAS PRINCESAS I', 'JARDIM DAS PRINCESAS'),
  ('Popular', 'JARDIM DAS REGINAS', 'JARDIM DAS REGINAS'),
  ('José Abrão', 'JARDIM DAS VIRTUDES - PARTE', 'JARDIM DAS VIRTUDES'),
  ('Moreninha', 'JARDIM DO CÓRREGO', 'JARDIM DO CORREGO'),
  ('Panamá', 'JARDIM DO ZÉ PEREIRA', 'JARDIM DO ZE PEREIRA'),
  ('Tijuca', 'JARDIM DOS BOGGI', 'JARDIM DOS BOGGI'),
  ('Jardim dos Estados', 'Jardim dos Estados', 'JARDIM DOS ESTADOS'),
  ('Centenário', 'JARDIM ENSEADA DOS PÁSSAROS', 'JARDIM ENSEADA DOS PASSAROS'),
  ('Estrela Dalva', 'JARDIM ESTRELA DALVA II', 'JARDIM ESTRELA DALVA'),
  ('Leblon', 'JARDIM EUROPA', 'JARDIM EUROPA'),
  ('Nasser', 'JARDIM FLUMINENSE', 'JARDIM FLUMINENSE'),
  ('Autonomista', 'JARDIM GIOCONDO ORSI', 'JARDIM GIOCONDO ORSI'),
  ('Moreninha', 'JARDIM GRAMADO', 'JARDIM GRAMADO'),
  ('São Bento', 'JARDIM GUARUJÁ', 'JARDIM GUARUJA'),
  ('São Lourenço', 'JARDIM IBIRAPUERA', 'JARDIM IBIRAPUERA'),
  ('Santo Antônio', 'JARDIM IMÁ', 'JARDIM IMA'),
  ('Santo Antônio', 'JARDIM IMÁ - 2ª SEÇÃO', 'JARDIM IMA 2 SECAO'),
  ('Núcleo Industrial', 'JARDIM INÁPOLIS', 'JARDIM INAPOLIS'),
  ('Universitário', 'JARDIM INDIANÁPOLIS', 'JARDIM INDIANAPOLIS'),
  ('Sobrinho', 'JARDIM IPANEMA', 'JARDIM IPANEMA'),
  ('Popular', 'JARDIM ITÁLIA', 'JARDIM ITALIA'),
  ('Rita Vieira', 'JARDIM ITAMARACÁ', 'JARDIM ITAMARACA'),
  ('Carlota', 'JARDIM ITAPEMA - PARTE', 'JARDIM ITAPEMA'),
  ('Santo Amaro', 'JARDIM ITAPUÃ', 'JARDIM ITAPUA'),
  ('Novos Estados', 'JARDIM JACARANDÁ', 'JARDIM JACARANDA'),
  ('Jacy', 'JARDIM JACY', 'JARDIM JACY'),
  ('Pioneiros', 'JARDIM JANE', 'JARDIM JANE'),
  ('Tiradentes', 'JARDIM JERUSALÉM', 'JARDIM JERUSALEM'),
  ('Jockey Club', 'JARDIM JOCKEY CLUB', 'JARDIM JOCKEY CLUB'),
  ('Batistão', 'JARDIM LAGOA BELA', 'JARDIM LAGOA BELA'),
  ('Rita Vieira', 'JARDIM LAGOA DOURADA', 'JARDIM LAGOA DOURADA'),
  ('Sobrinho', 'JARDIM LEONÍDIA', 'JARDIM LEONIDIA'),
  ('Los Angeles', 'JARDIM LOS ANGELES', 'JARDIM LOS ANGELES'),
  ('Alves Pereira', 'JARDIM MACAPÁ', 'JARDIM MACAPA'),
  ('Centenário', 'JARDIM MANAÍRA', 'JARDIM MANAIRA'),
  ('Santo Amaro', 'JARDIM MANDALA', 'JARDIM MANDALA'),
  ('Vilasboas', 'JARDIM MANSUR', 'JARDIM MANSUR'),
  ('Margarida', 'JARDIM MARABÁ', 'JARDIM MARABA'),
  ('Centro Oeste', 'JARDIM MARAJOARA', 'JARDIM MARAJOARA'),
  ('Jockey Club', 'JARDIM MARCOS ROBERTO', 'JARDIM MARCOS ROBERTO'),
  ('Caiçara', 'JARDIM MARINGÁ', 'JARDIM MARINGA'),
  ('Centro Oeste', 'JARDIM MÁRIO COVAS', 'JARDIM MARIO COVAS'),
  ('Panamá', 'JARDIM MATHILDE', 'JARDIM MATHILDE'),
  ('Batistão', 'JARDIM MATO GROSSO', 'JARDIM MATO GROSSO'),
  ('Coronel Antonino', 'JARDIM MIRASOL', 'JARDIM MIRASOL'),
  ('Universitário', 'JARDIM MOEMA', 'JARDIM MOEMA'),
  ('Centenário', 'JARDIM MONTE ALEGRE', 'JARDIM MONTE ALEGRE'),
  ('Nasser', 'JARDIM MONTE ALTO', 'JARDIM MONTE ALTO'),
  ('Monte Líbano', 'JARDIM MONTE LÍBANO', 'JARDIM MONTE LIBANO'),
  ('Planalto', 'JARDIM MONTE VERDE', 'JARDIM MONTE VERDE'),
  ('Centenário', 'JARDIM MONTEREY', 'JARDIM MONTEREY'),
  ('Novos Estados', 'JARDIM MONTEVIDEU', 'JARDIM MONTEVIDEU'),
  ('Alves Pereira', 'JARDIM MONUMENTO', 'JARDIM MONUMENTO'),
  ('Los Angeles', 'JARDIM MORADA DO SOL', 'JARDIM MORADA DO SOL'),
  ('Pioneiros', 'JARDIM MORENÃO', 'JARDIM MORENAO'),
  ('Mata do Segredo', 'JARDIM NASCENTE DO SEGREDO', 'JARDIM NASCENTE DO SEGREDO')
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ('Alves Pereira', 'JARDIM NASHVILLE', 'JARDIM NASHVILLE'),
  ('Piratininga', 'JARDIM NHANHÁ', 'JARDIM NHANHA'),
  ('Noroeste', 'JARDIM NOROESTE', 'JARDIM NOROESTE'),
  ('Rita Vieira', 'JARDIM NOSSA SENHORA DO PERPÉTUO SOCORRO', 'JARDIM NOSSA SENHORA DO PERPETUO SOCORRO'),
  ('Moreninha', 'JARDIM NOVA CAPITAL', 'JARDIM NOVA CAPITAL'),
  ('Bela Vista', 'JARDIM NOVA ERA', 'JARDIM NOVA ERA'),
  ('Moreninha', 'JARDIM NOVA JERUSALÉM', 'JARDIM NOVA JERUSALEM'),
  ('Seminário', 'JARDIM ORACÍLIA', 'JARDIM ORACILIA'),
  ('Coophavila II', 'JARDIM OURO VERDE', 'JARDIM OURO VERDE'),
  ('Coophavila II', 'JARDIM OURO VERDE - 1ª SEÇÃO', 'JARDIM OURO VERDE 1 SECAO'),
  ('Coophavila II', 'JARDIM OURO VERDE - 2ª SEÇÃO', 'JARDIM OURO VERDE 2 SECAO'),
  ('Universitário', 'JARDIM PACAEMBU', 'JARDIM PACAEMBU'),
  ('Panamá', 'JARDIM PANAMÁ', 'JARDIM PANAMA'),
  ('Nasser', 'JARDIM PAQUETÁ', 'JARDIM PAQUETA'),
  ('Nasser', 'JARDIM PARADISO', 'JARDIM PARADISO'),
  ('Centro Oeste', 'JARDIM PARIS', 'JARDIM PARIS'),
  ('Jardim Paulista', 'Jardim Paulista', 'JARDIM PAULISTA'),
  ('Centro Oeste', 'JARDIM PAULO COELHO MACHADO', 'JARDIM PAULO COELHO MACHADO'),
  ('Centenário', 'JARDIM PÊNFIGO', 'JARDIM PENFIGO'),
  ('Popular', 'JARDIM PETRÓPOLIS - PARTE', 'JARDIM PETROPOLIS'),
  ('Chácara dos Poderes', 'JARDIM PINHEIROS', 'JARDIM PINHEIROS'),
  ('Itanhangá', 'JARDIM PIRACICABA', 'JARDIM PIRACICABA'),
  ('Piratininga', 'JARDIM PIRATININGA', 'JARDIM PIRATININGA'),
  ('Tarumã', 'JARDIM PORTAL DAS LARANJEIRAS', 'JARDIM PORTAL DAS LARANJEIRAS'),
  ('Mata do Segredo', 'JARDIM PRESIDENTE', 'JARDIM PRESIDENTE'),
  ('Centenário', 'JARDIM RADIALISTA', 'JARDIM RADIALISTA'),
  ('Caiobá', 'JARDIM RANCHO ALEGRE I', 'JARDIM RANCHO ALEGRE'),
  ('Pioneiros', 'JARDIM ROSELÂNDIA', 'JARDIM ROSELANDIA'),
  ('Pioneiros', 'JARDIM RUBIÁCEA', 'JARDIM RUBIACEA'),
  ('Maria Aparecida Pedrossian', 'JARDIM SAMAMBAIA', 'JARDIM SAMAMBAIA'),
  ('Bela Vista', 'JARDIM SANTA CATARINA', 'JARDIM SANTA CATARINA'),
  ('São Conrado', 'JARDIM SANTA EMÍLIA', 'JARDIM SANTA EMILIA'),
  ('Moreninha', 'JARDIM SANTA FELICIDADE', 'JARDIM SANTA FELICIDADE'),
  ('Pioneiros', 'JARDIM SANTA ÚRSULA', 'JARDIM SANTA URSULA'),
  ('São Bento', 'JARDIM SÃO BENTO', 'JARDIM SAO BENTO'),
  ('São Conrado', 'JARDIM SÃO CONRADO - PARTE', 'JARDIM SAO CONRADO'),
  ('Tiradentes', 'JARDIM SÃO JUDAS TADEU', 'JARDIM SAO JUDAS TADEU'),
  ('São Lourenço', 'JARDIM SÃO LOURENÇO', 'JARDIM SAO LOURENCO'),
  ('Monte Castelo', 'JARDIM SÃO PAULO - PARTE', 'JARDIM SAO PAULO'),
  ('Popular', 'JARDIM SAYONARA', 'JARDIM SAYONARA'),
  ('Seminário', 'JARDIM SEMINÁRIO', 'JARDIM SEMINARIO'),
  ('Jardim dos Estados', 'JARDIM SETE DE SETEMBRO', 'JARDIM SETE DE SETEMBRO'),
  ('Tarumã', 'JARDIM SOL POENTE', 'JARDIM SOL POENTE'),
  ('Los Angeles', 'JARDIM SUMATRA', 'JARDIM SUMATRA'),
  ('Coronel Antonino', 'JARDIM TALISMÃ', 'JARDIM TALISMA'),
  ('Autonomista', 'JARDIM TAQUARI', 'JARDIM TAQUARI'),
  ('Taquarussu', 'JARDIM TAQUARUSSU', 'JARDIM TAQUARUSSU'),
  ('Tarumã', 'JARDIM TARUMÃ', 'JARDIM TARUMA'),
  ('Leblon', 'JARDIM TATIANA', 'JARDIM TATIANA'),
  ('Veraneio', 'JARDIM TAYANA', 'JARDIM TAYANA'),
  ('Tijuca', 'JARDIM TIJUCA', 'JARDIM TIJUCA'),
  ('Universitário', 'JARDIM TROPICAL', 'JARDIM TROPICAL'),
  ('Tv Morena', 'JARDIM TV MORENA', 'JARDIM TV MORENA'),
  ('Los Angeles', 'JARDIM UIRAPURU', 'JARDIM UIRAPURU'),
  ('Chácara Cachoeira', 'JARDIM UMUARAMA', 'JARDIM UMUARAMA'),
  ('Nasser', 'JARDIM VENEZA', 'JARDIM VENEZA'),
  ('Santo Antônio', 'JARDIM VERA CRUZ', 'JARDIM VERA CRUZ'),
  ('Chácara dos Poderes', 'JARDIM VERANEIO - PARTE', 'JARDIM VERANEIO'),
  ('Pioneiros', 'JARDIM VICENTINO', 'JARDIM VICENTINO'),
  ('Nova Lima', 'JARDIM VIDA NOVA', 'JARDIM VIDA NOVA'),
  ('Coophavila II', 'JARDIM VILA KELLEM', 'JARDIM VILA KELLEM'),
  ('Batistão', 'JARDIM VILLA LOBOS', 'JARDIM VILLA LOBOS'),
  ('Itanhangá', 'JARDIM VISTA ALEGRE', 'JARDIM VISTA ALEGRE'),
  ('Tiradentes', 'JARDIM VITÓRIA', 'JARDIM VITORIA'),
  ('Autonomista', 'JARDIM VITRINE', 'JARDIM VITRINE'),
  ('Jockey Club', 'Jockey Club', 'JOCKEY CLUB'),
  ('José Abrão', 'José Abrão', 'JOSE ABRAO'),
  ('Moreninha', 'JOSÉ MAKSOUD', 'JOSE MAKSOUD'),
  ('Nova Lima', 'JOSÉ PRATES', 'JOSE PRATES'),
  ('Nova Lima', 'JOSÉ TAVARES DO COUTO', 'JOSE TAVARES DO COUTO'),
  ('Lageado', 'Lageado', 'LAGEADO'),
  ('Seminário', 'LAGOA DA CRUZ', 'LAGOA DA CRUZ'),
  ('Batistão', 'LAGOA PARK', 'LAGOA PARK'),
  ('Sobrinho', 'LAR DO TRABALHADOR', 'LAR DO TRABALHADOR'),
  ('Leblon', 'Leblon', 'LEBLON'),
  ('Chácara dos Poderes', 'LIEU UNIQUE', 'LIEU UNIQUE'),
  ('Los Angeles', 'Los Angeles', 'LOS ANGELES'),
  ('Tiradentes', 'LOTEAMENTO INDÍGENA MARÇAL DE SOUZA', 'LOTEAMENTO INDIGENA MARCAL DE SOUZA'),
  ('Alves Pereira', 'LOTEAMENTO MUNICIPAL ALAN SOARES', 'LOTEAMENTO MUNICIPAL ALAN SOARES'),
  ('Moreninha', 'LOTEAMENTO MUNICIPAL BARREIRAS', 'LOTEAMENTO MUNICIPAL BARREIRAS')
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ('Centro Oeste', 'LOTEAMENTO MUNICIPAL BRANDÃO', 'LOTEAMENTO MUNICIPAL BRANDAO'),
  ('Tiradentes', 'LOTEAMENTO MUNICIPAL CAVAN', 'LOTEAMENTO MUNICIPAL CAVAN'),
  ('Mata do Jacinto', 'LOTEAMENTO MUNICIPAL CEASA', 'LOTEAMENTO MUNICIPAL CEASA'),
  ('Mata do Segredo', 'LOTEAMENTO MUNICIPAL CRISTALDO', 'LOTEAMENTO MUNICIPAL CRISTALDO'),
  ('Tiradentes', 'LOTEAMENTO MUNICIPAL DALVA DE OLIVEIRA', 'LOTEAMENTO MUNICIPAL DALVA DE OLIVEIRA'),
  ('Lageado', 'LOTEAMENTO MUNICIPAL DOM ANTÔNIO BARBOSA', 'LOTEAMENTO MUNICIPAL DOM ANTONIO BARBOSA'),
  ('Nasser', 'LOTEAMENTO MUNICIPAL DR. MIGUEL VIEIRA FERREIRA', 'LOTEAMENTO MUNICIPAL DR MIGUEL VIEIRA FERREIRA'),
  ('Margarida', 'LOTEAMENTO MUNICIPAL GUAICURUS', 'LOTEAMENTO MUNICIPAL GUAICURUS'),
  ('São Conrado', 'LOTEAMENTO MUNICIPAL INTERPRAIA', 'LOTEAMENTO MUNICIPAL INTERPRAIA'),
  ('Margarida', 'LOTEAMENTO MUNICIPAL JABURU', 'LOTEAMENTO MUNICIPAL JABURU'),
  ('Santo Antônio', 'LOTEAMENTO MUNICIPAL JAGUARIBE', 'LOTEAMENTO MUNICIPAL JAGUARIBE'),
  ('Rita Vieira', 'LOTEAMENTO MUNICIPAL JARDIM ANHANGUERA', 'LOTEAMENTO MUNICIPAL JARDIM ANHANGUERA'),
  ('Coronel Antonino', 'LOTEAMENTO MUNICIPAL JARDIM CAMPO VERDE', 'LOTEAMENTO MUNICIPAL JARDIM CAMPO VERDE'),
  ('Popular', 'LOTEAMENTO MUNICIPAL JARDIM PANTANAL', 'LOTEAMENTO MUNICIPAL JARDIM PANTANAL'),
  ('Tijuca', 'LOTEAMENTO MUNICIPAL JARDIM VERDES MARES', 'LOTEAMENTO MUNICIPAL JARDIM VERDES MARES'),
  ('Margarida', 'LOTEAMENTO MUNICIPAL JOAQUIM EUZÉBIO', 'LOTEAMENTO MUNICIPAL JOAQUIM EUZEBIO'),
  ('Popular', 'LOTEAMENTO MUNICIPAL MACAÉ', 'LOTEAMENTO MUNICIPAL MACAE'),
  ('Carandá', 'LOTEAMENTO MUNICIPAL MÁRIO DE ANDRADE', 'LOTEAMENTO MUNICIPAL MARIO DE ANDRADE'),
  ('Coronel Antonino', 'LOTEAMENTO MUNICIPAL NACIONAL', 'LOTEAMENTO MUNICIPAL NACIONAL'),
  ('Mata do Jacinto', 'LOTEAMENTO MUNICIPAL NAZARÉ', 'LOTEAMENTO MUNICIPAL NAZARE'),
  ('Tiradentes', 'LOTEAMENTO MUNICIPAL NÚCLEO TIRADENTES', 'LOTEAMENTO MUNICIPAL NUCLEO TIRADENTES'),
  ('Margarida', 'LOTEAMENTO MUNICIPAL PAULO VI', 'LOTEAMENTO MUNICIPAL PAULO'),
  ('Nova Lima', 'LOTEAMENTO MUNICIPAL PEREIRA BORGES', 'LOTEAMENTO MUNICIPAL PEREIRA BORGES'),
  ('Coronel Antonino', 'LOTEAMENTO MUNICIPAL RAÍZES', 'LOTEAMENTO MUNICIPAL RAIZES'),
  ('Moreninha', 'LOTEAMENTO MUNICIPAL RIBEIRA', 'LOTEAMENTO MUNICIPAL RIBEIRA'),
  ('Coronel Antonino', 'LOTEAMENTO MUNICIPAL RIO DE JANEIRO', 'LOTEAMENTO MUNICIPAL RIO DE JANEIRO'),
  ('Mata do Segredo', 'LOTEAMENTO MUNICIPAL SALINAS', 'LOTEAMENTO MUNICIPAL SALINAS'),
  ('Margarida', 'LOTEAMENTO MUNICIPAL VERDE BRASIL', 'LOTEAMENTO MUNICIPAL VERDE BRASIL'),
  ('Nova Lima', 'MANDELA 1', 'MANDELA'),
  ('José Abrão', 'MANOEL TAVEIRA - PARTE', 'MANOEL TAVEIRA'),
  ('Margarida', 'Margarida', 'MARGARIDA'),
  ('Maria Aparecida Pedrossian', 'Maria Aparecida Pedrossian', 'MARIA APARECIDA PEDROSSIAN'),
  ('Mata do Jacinto', 'Mata do Jacinto', 'MATA DO JACINTO'),
  ('Mata do Segredo', 'Mata do Segredo', 'MATA DO SEGREDO'),
  ('Bela Vista', 'MIGUEL COUTO - PARTE', 'MIGUEL COUTO'),
  ('Chácara Cachoeira', 'MIGUEL COUTO - 2ª SEÇÃO', 'MIGUEL COUTO 2 SECAO'),
  ('Chácara Cachoeira', 'MIGUEL COUTO - 3ª SEÇÃO', 'MIGUEL COUTO 3 SECAO'),
  ('Cruzeiro', 'MONTE CASTELO', 'MONTE CASTELO'),
  ('Monte Castelo', 'MONTE CASTELO SETOR 1A', 'MONTE CASTELO SETOR 1A'),
  ('Cruzeiro', 'MONTE CASTELO - SETOR 3 - PARTE', 'MONTE CASTELO SETOR 3'),
  ('Monte Líbano', 'Monte Líbano', 'MONTE LIBANO'),
  ('Coronel Antonino', 'MORADA DO SOSSEGO', 'MORADA DO SOSSEGO'),
  ('Nasser', 'MORADA DOS DEUSES', 'MORADA DOS DEUSES'),
  ('Núcleo Industrial', 'MORADA IMPERIAL', 'MORADA IMPERIAL'),
  ('Coronel Antonino', 'MORADA VERDE', 'MORADA VERDE'),
  ('Moreninha', 'Moreninha', 'MORENINHA'),
  ('Chácara Cachoeira', 'NAHIMA PARK', 'NAHIMA PARK'),
  ('Nasser', 'Nasser', 'NASSER'),
  ('Noroeste', 'Noroeste', 'NOROESTE'),
  ('Mata do Segredo', 'NORTH PARK', 'NORTH PARK'),
  ('Nasser', 'NOSSA SENHORA DAS GRAÇAS', 'NOSSA SENHORA DAS GRACAS'),
  ('Cruzeiro', 'NOSSA SENHORA DE FÁTIMA - PARTE', 'NOSSA SENHORA DE FATIMA'),
  ('Nova Campo Grande', 'Nova Campo Grande', 'NOVA CAMPO GRANDE'),
  ('Nova Campo Grande', 'NOVA CAMPO GRANDE BLOCO 01', 'NOVA CAMPO GRANDE BLOCO'),
  ('Nova Campo Grande', 'NOVA CAMPO GRANDE BLOCO 12 - PARTE', 'NOVA CAMPO GRANDE BLOCO 12'),
  ('Moreninha', 'NOVA CONQUISTA', 'NOVA CONQUISTA'),
  ('Piratininga', 'NOVA ESPERANÇA', 'NOVA ESPERANCA'),
  ('Nova Lima', 'Nova Lima', 'NOVA LIMA'),
  ('Noroeste', 'NOVA SERRANA', 'NOVA SERRANA'),
  ('Maria Aparecida Pedrossian', 'NOVA VIVENDAS', 'NOVA VIVENDAS'),
  ('Moreninha', 'NOVO BRASIL', 'NOVO BRASIL'),
  ('Popular', 'NOVO DIA', 'NOVO DIA'),
  ('Novos Estados', 'Novos Estados', 'NOVOS ESTADOS'),
  ('Coronel Antonino', 'NÚCLEO BECO DA LIBERDADE', 'NUCLEO BECO DA LIBERDADE'),
  ('Guanandi', 'NÚCLEO DONA NETA', 'NUCLEO DONA NETA'),
  ('Coronel Antonino', 'NÚCLEO GUATAMBU', 'NUCLEO GUATAMBU'),
  ('Aero Rancho', 'NÚCLEO HABITACIONAL AERO RANCHO', 'NUCLEO HABITACIONAL AERO RANCHO'),
  ('Leblon', 'NÚCLEO HABITACIONAL BONANÇA', 'NUCLEO HABITACIONAL BONANCA'),
  ('José Abrão', 'NÚCLEO HABITACIONAL JOSÉ ABRÃO', 'NUCLEO HABITACIONAL JOSE ABRAO'),
  ('Moreninha', 'NÚCLEO HABITACIONAL MORENINHA I', 'NUCLEO HABITACIONAL MORENINHA'),
  ('Alves Pereira', 'NÚCLEO HABITACIONAL UNIVERSITÁRIAS', 'NUCLEO HABITACIONAL UNIVERSITARIAS'),
  ('Núcleo Industrial', 'Núcleo Industrial', 'NUCLEO INDUSTRIAL'),
  ('Nova Lima', 'OSCAR SALAZAR MOURA DA CRUZ', 'OSCAR SALAZAR MOURA DA CRUZ'),
  ('Panamá', 'Panamá', 'PANAMA'),
  ('Maria Aparecida Pedrossian', 'PANORAMA', 'PANORAMA'),
  ('Sobrinho', 'PAPA JOÃO PAULO II', 'PAPA JOAO PAULO'),
  ('Moreninha', 'PARAÍSO DO LAGEADO', 'PARAISO DO LAGEADO'),
  ('Jardim Paulista', 'PARANAENSE - PARTE', 'PARANAENSE'),
  ('Parati', 'Parati', 'PARATI'),
  ('Popular', 'PARAVÁ', 'PARAVA')
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ('Vilasboas', 'PARQUE DALLAS', 'PARQUE DALLAS'),
  ('Lageado', 'PARQUE DO LAGEADO', 'PARQUE DO LAGEADO'),
  ('Lageado', 'PARQUE DO SOL', 'PARQUE DO SOL'),
  ('Alves Pereira', 'PARQUE DO TRABALHADOR', 'PARQUE DO TRABALHADOR'),
  ('Sobrinho', 'PARQUE DOS IPÊS', 'PARQUE DOS IPES'),
  ('José Abrão', 'PARQUE DOS LARANJAIS - PARTE', 'PARQUE DOS LARANJAIS'),
  ('Lageado', 'PARQUE DOS SABIÁS', 'PARQUE DOS SABIAS'),
  ('Nova Lima', 'PARQUE IGUATEMI', 'PARQUE IGUATEMI'),
  ('Coronel Antonino', 'PARQUE IZABEL GARDENS', 'PARQUE IZABEL GARDENS'),
  ('Parque Jardim Atlântico', 'Parque Jardim Atlântico', 'PARQUE JARDIM ATLANTICO'),
  ('Rita Vieira', 'PARQUE JATOBÁ', 'PARQUE JATOBA'),
  ('Centro Oeste', 'PARQUE NOVO SÉCULO', 'PARQUE NOVO SECULO'),
  ('Tiradentes', 'PARQUE RESIDENCIAL ANHEMBI', 'PARQUE RESIDENCIAL ANHEMBI'),
  ('Tiradentes', 'PARQUE RESIDENCIAL ARNALDO ESTEVÃO DE FIGUEIREDO', 'PARQUE RESIDENCIAL ARNALDO ESTEVAO DE FIGUEIREDO'),
  ('Nasser', 'PARQUE RESIDENCIAL AZALÉIA', 'PARQUE RESIDENCIAL AZALEIA'),
  ('Panamá', 'PARQUE RESIDENCIAL BELLINATE', 'PARQUE RESIDENCIAL BELLINATE'),
  ('Cabreúva', 'PARQUE RESIDENCIAL CABREÚVA', 'PARQUE RESIDENCIAL CABREUVA'),
  ('Maria Aparecida Pedrossian', 'PARQUE RESIDENCIAL DAMHA', 'PARQUE RESIDENCIAL DAMHA'),
  ('União', 'PARQUE RESIDENCIAL DOS GIRASSÓIS', 'PARQUE RESIDENCIAL DOS GIRASSOIS'),
  ('Centenário', 'PARQUE RESIDENCIAL IRACY COELHO NETTO', 'PARQUE RESIDENCIAL IRACY COELHO NETTO'),
  ('Pioneiros', 'PARQUE RESIDENCIAL LISBOA', 'PARQUE RESIDENCIAL LISBOA'),
  ('Maria Aparecida Pedrossian', 'PARQUE RESIDENCIAL MARIA APARECIDA PEDROSSIAN', 'PARQUE RESIDENCIAL MARIA APARECIDA PEDROSSIAN'),
  ('União', 'PARQUE RESIDENCIAL UNIÃO', 'PARQUE RESIDENCIAL UNIAO'),
  ('Rita Vieira', 'PARQUE RITA VIEIRA', 'PARQUE RITA VIEIRA'),
  ('Sobrinho', 'PARQUE SÃO DOMINGOS', 'PARQUE SAO DOMINGOS'),
  ('Centro Oeste', 'PARTE DA CHÁCARA LAGEADO', 'PARTE DA CHACARA LAGEADO'),
  ('Universitário', 'PEQUENA FLOR I', 'PEQUENA FLOR'),
  ('Autonomista', 'PETIT PARK', 'PETIT PARK'),
  ('Pioneiros', 'Pioneiros', 'PIONEIROS'),
  ('Piratininga', 'Piratininga', 'PIRATININGA'),
  ('Planalto', 'Planalto', 'PLANALTO'),
  ('Novos Estados', 'POLO EMPRESARIAL NORTE', 'POLO EMPRESARIAL NORTE'),
  ('Núcleo Industrial', 'POLO EMPRESARIAL OESTE', 'POLO EMPRESARIAL OESTE'),
  ('Moreninha', 'POLO EMPRESARIAL SUL', 'POLO EMPRESARIAL SUL'),
  ('Popular', 'Popular', 'POPULAR'),
  ('Caiobá', 'PORTAL CAIOBÁ', 'PORTAL CAIOBA'),
  ('Carandá', 'PORTAL DE ITAYARA', 'PORTAL DE ITAYARA'),
  ('Seminário', 'PORTAL DO GRAMADO', 'PORTAL DO GRAMADO'),
  ('Panamá', 'PORTAL DO PANAMÁ', 'PORTAL DO PANAMA'),
  ('Pioneiros', 'PORTO GALO', 'PORTO GALO'),
  ('Alves Pereira', 'PORTO SEGURO', 'PORTO SEGURO'),
  ('Tiradentes', 'PORTOBELLO', 'PORTOBELLO'),
  ('Monte Castelo', 'PRAIA DA URCA', 'PRAIA DA URCA'),
  ('Veraneio', 'QUINTAS DO RIO VERMELHO', 'QUINTAS DO RIO VERMELHO'),
  ('Pioneiros', 'RECANTO DAS ANDORINHAS', 'RECANTO DAS ANDORINHAS'),
  ('Universitário', 'RECANTO DAS PALMEIRAS', 'RECANTO DAS PALMEIRAS'),
  ('Panamá', 'RECANTO DOS PÁSSAROS', 'RECANTO DOS PASSAROS'),
  ('Coronel Antonino', 'RECANTO PANTANEIRO', 'RECANTO PANTANEIRO'),
  ('Tiradentes', 'REGINA', 'REGINA'),
  ('Nova Lima', 'RESERVA SANTA INÊS', 'RESERVA SANTA INES'),
  ('Mata do Jacinto', 'RESIDENCIAL ABAETÉ', 'RESIDENCIAL ABAETE'),
  ('Nasser', 'RESIDENCIAL ALTO TAMANDARÉ', 'RESIDENCIAL ALTO TAMANDARE'),
  ('Panamá', 'RESIDENCIAL ANA MARIA DO COUTO', 'RESIDENCIAL ANA MARIA DO COUTO'),
  ('São Conrado', 'RESIDENCIAL AQUARIUS I', 'RESIDENCIAL AQUARIUS'),
  ('Coronel Antonino', 'RESIDENCIAL ATLÂNTICO SUL', 'RESIDENCIAL ATLANTICO SUL'),
  ('Tijuca', 'RESIDENCIAL BARRA DA TIJUCA', 'RESIDENCIAL BARRA DA TIJUCA'),
  ('Universitário', 'RESIDENCIAL BETAVILLE', 'RESIDENCIAL BETAVILLE'),
  ('Panamá', 'RESIDENCIAL BÚZIOS', 'RESIDENCIAL BUZIOS'),
  ('Tijuca', 'RESIDENCIAL CAMBARÁ', 'RESIDENCIAL CAMBARA'),
  ('Nasser', 'RESIDENCIAL CARAJÁS', 'RESIDENCIAL CARAJAS'),
  ('Centenário', 'RESIDENCIAL CEDRINHO', 'RESIDENCIAL CEDRINHO'),
  ('Vilasboas', 'RESIDENCIAL DELFOS', 'RESIDENCIAL DELFOS'),
  ('Pioneiros', 'RESIDENCIAL DO LAGO', 'RESIDENCIAL DO LAGO'),
  ('São Conrado', 'RESIDENCIAL FIGUEIRAS DO PARQUE', 'RESIDENCIAL FIGUEIRAS DO PARQUE'),
  ('União', 'RESIDENCIAL FLORES', 'RESIDENCIAL FLORES'),
  ('Monte Castelo', 'RESIDENCIAL GABURA', 'RESIDENCIAL GABURA'),
  ('Mata do Segredo', 'RESIDENCIAL GAMA', 'RESIDENCIAL GAMA'),
  ('Pioneiros', 'RESIDENCIAL GERALDO CORRÊA DA SILVA', 'RESIDENCIAL GERALDO CORREA DA SILVA'),
  ('Santo Amaro', 'RESIDENCIAL HUGO RODRIGUES', 'RESIDENCIAL HUGO RODRIGUES'),
  ('Alves Pereira', 'RESIDENCIAL ILHÉUS', 'RESIDENCIAL ILHEUS'),
  ('Monte Castelo', 'RESIDENCIAL INDAIÁ', 'RESIDENCIAL INDAIA'),
  ('Carandá', 'RESIDENCIAL ITACOLOMI', 'RESIDENCIAL ITACOLOMI'),
  ('Tiradentes', 'RESIDENCIAL ITATIAIA', 'RESIDENCIAL ITATIAIA'),
  ('Pioneiros', 'RESIDENCIAL JARDIM BOTAFOGO', 'RESIDENCIAL JARDIM BOTAFOGO'),
  ('Parati', 'RESIDENCIAL JARDIM DAS NAÇÕES', 'RESIDENCIAL JARDIM DAS NACOES'),
  ('Tiradentes', 'RESIDENCIAL JARDIM FLAMBOYANT', 'RESIDENCIAL JARDIM FLAMBOYANT'),
  ('Chácara Cachoeira', 'RESIDENCIAL JATIUKA PARK', 'RESIDENCIAL JATIUKA PARK'),
  ('Pioneiros', 'RESIDENCIAL JOANA D''ARC', 'RESIDENCIAL JOANA D ARC'),
  ('Caiobá', 'RESIDENCIAL JOÃO ALBERTO AMORIM DOS SANTOS', 'RESIDENCIAL JOAO ALBERTO AMORIM DOS SANTOS'),
  ('Alves Pereira', 'RESIDENCIAL JOÃO SCARANO', 'RESIDENCIAL JOAO SCARANO')
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ('Lageado', 'RESIDENCIAL JOSÉ TERUEL FILHO', 'RESIDENCIAL JOSE TERUEL FILHO'),
  ('Nasser', 'RESIDENCIAL MARIA NEVES', 'RESIDENCIAL MARIA NEVES'),
  ('Nova Campo Grande', 'RESIDENCIAL NELSON TRAD', 'RESIDENCIAL NELSON TRAD'),
  ('Tiradentes', 'RESIDENCIAL NOVA TIRADENTES', 'RESIDENCIAL NOVA TIRADENTES'),
  ('Seminário', 'RESIDENCIAL NOVO SEMINÁRIO', 'RESIDENCIAL NOVO SEMINARIO'),
  ('Monte Castelo', 'RESIDENCIAL OCTÁVIO PÉCORA', 'RESIDENCIAL OCTAVIO PECORA'),
  ('Maria Aparecida Pedrossian', 'RESIDENCIAL OITI', 'RESIDENCIAL OITI'),
  ('União', 'RESIDENCIAL OLIVEIRA I', 'RESIDENCIAL OLIVEIRA'),
  ('Centenário', 'RESIDENCIAL OURO PRETO', 'RESIDENCIAL OURO PRETO'),
  ('Panamá', 'RESIDENCIAL PARQUE DOS BANCÁRIOS', 'RESIDENCIAL PARQUE DOS BANCARIOS'),
  ('Sobrinho', 'RESIDENCIAL PARQUE DOS FLAMINGOS', 'RESIDENCIAL PARQUE DOS FLAMINGOS'),
  ('Centro Oeste', 'RESIDENCIAL RAMEZ TEBET', 'RESIDENCIAL RAMEZ TEBET'),
  ('Nasser', 'RESIDENCIAL RECANTO DO CERRADO', 'RESIDENCIAL RECANTO DO CERRADO'),
  ('Monte Castelo', 'RESIDENCIAL RESERVA MORENA', 'RESIDENCIAL RESERVA MORENA'),
  ('Panamá', 'RESIDENCIAL SAGARANA', 'RESIDENCIAL SAGARANA'),
  ('Noroeste', 'RESIDENCIAL SHALOM', 'RESIDENCIAL SHALOM'),
  ('Santo Amaro', 'RESIDENCIAL SÍRIO LIBANÊS I', 'RESIDENCIAL SIRIO LIBANES'),
  ('Carandá', 'RESIDENCIAL TAYAMÃ PARK', 'RESIDENCIAL TAYAMA PARK'),
  ('Universitário', 'RESIDENCIAL TERRA DOS PEQUIS', 'RESIDENCIAL TERRA DOS PEQUIS'),
  ('Los Angeles', 'RESIDENCIAL TERRA MORENA', 'RESIDENCIAL TERRA MORENA'),
  ('Nasser', 'RESIDENCIAL TOLENTINO', 'RESIDENCIAL TOLENTINO'),
  ('Tijuca', 'RESIDENCIAL UBATUBA', 'RESIDENCIAL UBATUBA'),
  ('Monte Castelo', 'RESIDENCIAL VALE DO SOL I', 'RESIDENCIAL VALE DO SOL'),
  ('Carandá', 'RESIDENCIAL VIA PARK', 'RESIDENCIAL VIA PARK'),
  ('Carandá', 'RESIDENCIAL VIA PARK ITÁLIA', 'RESIDENCIAL VIA PARK ITALIA'),
  ('Centenário', 'RESIDENCIAL VILA BELA', 'RESIDENCIAL VILA BELA'),
  ('Vilasboas', 'RESIDENCIAL VILA OLÍMPICA', 'RESIDENCIAL VILA OLIMPICA'),
  ('Bela Vista', 'RESIDENCIAL VILLAGE', 'RESIDENCIAL VILLAGE'),
  ('Rita Vieira', 'Rita Vieira', 'RITA VIEIRA'),
  ('Caiobá', 'RIVIEIRA PARK', 'RIVIEIRA PARK'),
  ('Chácara dos Poderes', 'RIVIERA HOME CLUBE', 'RIVIERA HOME CLUBE'),
  ('Santa Fé', 'ROYAL PARK', 'ROYAL PARK'),
  ('Chácara Cachoeira', 'SAN MARINO PARK', 'SAN MARINO PARK'),
  ('Santo Amaro', 'SANTA CAMÉLIA', 'SANTA CAMELIA'),
  ('Santa Cruz do Pontal', 'Santa Cruz do Pontal', 'SANTA CRUZ DO PONTAL'),
  ('Santa Fé', 'Santa Fé', 'SANTA FE'),
  ('Nasser', 'SANTA LUZIA', 'SANTA LUZIA'),
  ('Santo Amaro', 'Santo Amaro', 'SANTO AMARO'),
  ('Santo Antônio', 'Santo Antônio', 'SANTO ANTONIO'),
  ('Taveirópolis', 'SANTOS DUMONT', 'SANTOS DUMONT'),
  ('São Bento', 'São Bento', 'SAO BENTO'),
  ('Nasser', 'SÃO CAETANO', 'SAO CAETANO'),
  ('São Conrado', 'São Conrado', 'SAO CONRADO'),
  ('São Francisco', 'São Francisco', 'SAO FRANCISCO'),
  ('Batistão', 'SÃO JORGE DA LAGOA', 'SAO JORGE DA LAGOA'),
  ('São Lourenço', 'São Lourenço', 'SAO LOURENCO'),
  ('Tijuca', 'SÃO PEDRO', 'SAO PEDRO'),
  ('Seminário', 'Seminário', 'SEMINARIO'),
  ('Noroeste', 'SERRAVILLE', 'SERRAVILLE'),
  ('Nasser', 'SETVILLAGE I', 'SETVILLAGE'),
  ('Sítio Santa Maria', 'Sítio Santa Maria', 'SITIO SANTA MARIA'),
  ('Universitário', 'SITIOCAS ALVORADA', 'SITIOCAS ALVORADA'),
  ('Sítios Atlântico', 'Sítios Atlântico', 'SITIOS ATLANTICO'),
  ('Sítios de Recreio Itaim', 'Sítios de Recreio Itaim', 'SITIOS DE RECREIO ITAIM'),
  ('Sítios Moradia do Sol', 'Sítios Moradia do Sol', 'SITIOS MORADIA DO SOL'),
  ('Planalto', 'SKY RESIDENCE', 'SKY RESIDENCE'),
  ('Sobrinho', 'Sobrinho', 'SOBRINHO'),
  ('Mata do Jacinto', 'SÓTER', 'SOTER'),
  ('Estrela Dalva', 'TAQUARAL BOSQUE', 'TAQUARAL BOSQUE'),
  ('Taquarussu', 'Taquarussu', 'TAQUARUSSU'),
  ('Nova Lima', 'TARSILA DO AMARAL', 'TARSILA DO AMARAL'),
  ('Tarumã', 'Tarumã', 'TARUMA'),
  ('Taveirópolis', 'Taveirópolis', 'TAVEIROPOLIS'),
  ('Novos Estados', 'TERRAS ALPHA CAMPO GRANDE', 'TERRAS ALPHA CAMPO GRANDE'),
  ('Terras do Golfe', 'Terras do Golfe', 'TERRAS DO GOLFE'),
  ('Tijuca', 'Tijuca', 'TIJUCA'),
  ('Tiradentes', 'Tiradentes', 'TIRADENTES'),
  ('Tiradentes', 'TIRADENTES - 2ª SEÇÃO', 'TIRADENTES 2 SECAO'),
  ('Mata do Segredo', 'TREVISO', 'TREVISO'),
  ('Carandá', 'TROPICAL PARK', 'TROPICAL PARK'),
  ('Tv Morena', 'Tv Morena', 'TV MORENA'),
  ('União', 'União', 'UNIAO'),
  ('Universitário', 'Universitário', 'UNIVERSITARIO'),
  ('Universitário', 'UNIVERSITÁRIO - SEÇÃO A', 'UNIVERSITARIO SECAO A'),
  ('Universitário', 'UNIVERSITÁRIO - SEÇÃO B', 'UNIVERSITARIO SECAO B'),
  ('Pioneiros', 'UNIVERSITÁRIO - SEÇÃO C', 'UNIVERSITARIO SECAO C'),
  ('Alves Pereira', 'UNIVERSITÁRIO - SEÇÃO D', 'UNIVERSITARIO SECAO D'),
  ('Centro Oeste', 'VARANDAS DO CAMPO', 'VARANDAS DO CAMPO'),
  ('Veraneio', 'Veraneio', 'VERANEIO'),
  ('Centro Oeste', 'VEREDAS DO LAGEADO', 'VEREDAS DO LAGEADO')
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ('Los Angeles', 'VESPASIANO MARTINS', 'VESPASIANO MARTINS'),
  ('Nova Lima', 'VIDA NOVA II', 'VIDA NOVA'),
  ('Veraneio', 'VILA ABDALLA', 'VILA ABDALLA'),
  ('Jardim dos Estados', 'VILA ABDO', 'VILA ABDO'),
  ('Sobrinho', 'VILA ACRÓPOLIS', 'VILA ACROPOLIS'),
  ('Pioneiros', 'VILA ADELINA', 'VILA ADELINA'),
  ('Taquarussu', 'VILA AFONSO PENA', 'VILA AFONSO PENA'),
  ('Taquarussu', 'VILA AFONSO PENA JR.', 'VILA AFONSO PENA JR'),
  ('Centenário', 'VILA AIMORÉ', 'VILA AIMORE'),
  ('Sobrinho', 'VILA ALBA', 'VILA ALBA'),
  ('Sobrinho', 'VILA ALBA - COOPHACO II', 'VILA ALBA COOPHACO'),
  ('Santo Amaro', 'VILA ALMEIDA', 'VILA ALMEIDA'),
  ('Santo Amaro', 'VILA ALMEIDA - 1ª SEÇÃO', 'VILA ALMEIDA 1 SECAO'),
  ('Santo Amaro', 'VILA ALMEIDA - 2ª SEÇÃO', 'VILA ALMEIDA 2 SECAO'),
  ('São Lourenço', 'VILA ALMEIDA LIMA', 'VILA ALMEIDA LIMA'),
  ('Centro', 'VILA ALTA', 'VILA ALTA'),
  ('São Francisco', 'VILA ALTO DAS PAINEIRAS', 'VILA ALTO DAS PAINEIRAS'),
  ('Planalto', 'VILA ALTO SUMARÉ', 'VILA ALTO SUMARE'),
  ('Alves Pereira', 'VILA ALVES PEREIRA', 'VILA ALVES PEREIRA'),
  ('Centenário', 'VILA AMAPÁ', 'VILA AMAPA'),
  ('Centro', 'VILA AMÉRICA', 'VILA AMERICA'),
  ('Carvalho', 'VILA AMERICANA', 'VILA AMERICANA'),
  ('São Francisco', 'VILA ANFE', 'VILA ANFE'),
  ('Seminário', 'VILA ANTONIETA', 'VILA ANTONIETA'),
  ('Monte Líbano', 'VILA ANTÔNIO INÁCIO DE SOUZA', 'VILA ANTONIO INACIO DE SOUZA'),
  ('Bela Vista', 'VILA ANTÔNIO VENDAS - PARTE', 'VILA ANTONIO VENDAS'),
  ('Alves Pereira', 'VILA ANTUNES', 'VILA ANTUNES'),
  ('São Francisco', 'VILA APRAZÍVEL', 'VILA APRAZIVEL'),
  ('Centenário', 'VILA ÁUREA', 'VILA AUREA'),
  ('Amambaí', 'VILA AURORA', 'VILA AURORA'),
  ('Sobrinho', 'VILA AVIAÇÃO', 'VILA AVIACAO'),
  ('Bandeirantes', 'VILA BANDEIRANTES', 'VILA BANDEIRANTES'),
  ('Amambaí', 'VILA BARÃO DO RIO BRANCO', 'VILA BARAO DO RIO BRANCO'),
  ('Centro', 'VILA BARTÍRIA', 'VILA BARTIRIA'),
  ('Taveirópolis', 'VILA BELO HORIZONTE', 'VILA BELO HORIZONTE'),
  ('Taveirópolis', 'VILA BELO HORIZONTE - 2ª SEÇÃO', 'VILA BELO HORIZONTE 2 SECAO'),
  ('São Francisco', 'VILA BENJAMIN', 'VILA BENJAMIN'),
  ('Jardim dos Estados', 'VILA BERNARDO GOLDMAN', 'VILA BERNARDO GOLDMAN'),
  ('Autonomista', 'VILA BOA ESPERANÇA - PARTE', 'VILA BOA ESPERANCA'),
  ('Planalto', 'VILA BOA VISTA', 'VILA BOA VISTA'),
  ('Jockey Club', 'VILA BOM JESUS', 'VILA BOM JESUS'),
  ('Santo Antônio', 'VILA BOSQUE DA SAUDADE', 'VILA BOSQUE DA SAUDADE'),
  ('Autonomista', 'VILA CACIQUE', 'VILA CACIQUE'),
  ('Coronel Antonino', 'VILA CALIFÓRNIA', 'VILA CALIFORNIA'),
  ('Jardim dos Estados', 'VILA CAMPO DE MARTE', 'VILA CAMPO DE MARTE'),
  ('São Francisco', 'VILA CAPRI', 'VILA CAPRI'),
  ('Carlota', 'VILA CARLOTA - PARTE', 'VILA CARLOTA'),
  ('Margarida', 'VILA CAROLINA', 'VILA CAROLINA'),
  ('Carvalho', 'VILA CARVALHO', 'VILA CARVALHO'),
  ('Carvalho', 'VILA CARVALHO BAÍS', 'VILA CARVALHO BAIS'),
  ('Glória', 'VILA CASTELO', 'VILA CASTELO'),
  ('Margarida', 'VILA CATARINA', 'VILA CATARINA'),
  ('Cruzeiro', 'VILA CÉLIA', 'VILA CELIA'),
  ('Jockey Club', 'VILA CELINA', 'VILA CELINA'),
  ('Amambaí', 'VILA CIDADE - PARTE', 'VILA CIDADE'),
  ('Moreninha', 'VILA CIDADE MORENA', 'VILA CIDADE MORENA'),
  ('Sobrinho', 'VILA CINAMOMO', 'VILA CINAMOMO'),
  ('Alves Pereira', 'VILA CLÉLIA', 'VILA CLELIA'),
  ('Centro', 'VILA CLEMENTINA', 'VILA CLEMENTINA'),
  ('Universitário', 'VILA CONCÓRDIA', 'VILA CONCORDIA'),
  ('Planalto', 'VILA CORUMBÁ', 'VILA CORUMBA'),
  ('Bela Vista', 'VILA COSTA LIMA', 'VILA COSTA LIMA'),
  ('Santo Antônio', 'VILA COUTINHO', 'VILA COUTINHO'),
  ('Nasser', 'VILA COX', 'VILA COX'),
  ('São Francisco', 'VILA CRISTINA', 'VILA CRISTINA'),
  ('Autonomista', 'VILA CRUZEIRO DO SUL', 'VILA CRUZEIRO DO SUL'),
  ('Jardim dos Estados', 'VILA DA SAÚDE', 'VILA DA SAUDE'),
  ('Seminário', 'VILA DALILA', 'VILA DALILA'),
  ('Veraneio', 'VILA DANÚBIO AZUL', 'VILA DANUBIO AZUL'),
  ('Bela Vista', 'VILA DI PARMA', 'VILA DI PARMA'),
  ('Carandá', 'VILA DO POLONÊS', 'VILA DO POLONES'),
  ('Rita Vieira', 'VILA DOM PEDRITO', 'VILA DOM PEDRITO'),
  ('Santo Antônio', 'VILA DORISA', 'VILA DORISA'),
  ('Caiçara', 'VILA DOS MARIMBÁS', 'VILA DOS MARIMBAS'),
  ('Carlota', 'VILA DR. ALBUQUERQUE - PARTE', 'VILA DR ALBUQUERQUE'),
  ('Santo Amaro', 'VILA DR. JAIR GARCIA', 'VILA DR JAIR GARCIA'),
  ('Itanhangá', 'VILA DR. JOÃO ROSA', 'VILA DR JOAO ROSA'),
  ('Sobrinho', 'VILA DUQUE DE CAXIAS', 'VILA DUQUE DE CAXIAS'),
  ('Nova Campo Grande', 'VILA ELIANE', 'VILA ELIANE'),
  ('Nova Campo Grande', 'VILA ELIANE - 2ª SEÇÃO', 'VILA ELIANE 2 SECAO')
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ('Núcleo Industrial', 'VILA ENTRONCAMENTO', 'VILA ENTRONCAMENTO'),
  ('Sobrinho', 'VILA ESPANHOLA', 'VILA ESPANHOLA'),
  ('Cabreúva', 'VILA ESPLANADA', 'VILA ESPLANADA'),
  ('Cabreúva', 'VILA ESPLANADA - 2ª SEÇÃO', 'VILA ESPLANADA 2 SECAO'),
  ('Jardim dos Estados', 'VILA ESPORTIVA', 'VILA ESPORTIVA'),
  ('Planalto', 'VILA ESTEPHANIA', 'VILA ESTEPHANIA'),
  ('Glória', 'VILA EVA', 'VILA EVA'),
  ('Cabreúva', 'VILA FELICIANA CAROLINA - PARTE', 'VILA FELICIANA CAROLINA'),
  ('Caiobá', 'VILA FERNANDA', 'VILA FERNANDA'),
  ('Amambaí', 'VILA FLORESTA', 'VILA FLORESTA'),
  ('Glória', 'VILA FORTUNA', 'VILA FORTUNA'),
  ('Veraneio', 'VILA FUTURISTA', 'VILA FUTURISTA'),
  ('São Bento', 'VILA GALVÃO', 'VILA GALVAO'),
  ('Glória', 'VILA GASPAR', 'VILA GASPAR'),
  ('Itanhangá', 'VILA GATÃO', 'VILA GATAO'),
  ('Coophavila II', 'VILA GAÚCHA', 'VILA GAUCHA'),
  ('Centro', 'VILA GENERAL WOLGRAND', 'VILA GENERAL WOLGRAND'),
  ('Piratininga', 'VILA GETÚLIA BARBOSA', 'VILA GETULIA BARBOSA'),
  ('Glória', 'VILA GLÓRIA', 'VILA GLORIA'),
  ('Cruzeiro', 'VILA GOMES', 'VILA GOMES'),
  ('Jardim dos Estados', 'VILA GUARACIABA', 'VILA GUARACIABA'),
  ('Cabreúva', 'VILA GUARANI', 'VILA GUARANI'),
  ('Amambaí', 'VILA GUENKA', 'VILA GUENKA'),
  ('São Francisco', 'VILA HELENA', 'VILA HELENA'),
  ('Carlota', 'VILA IEDA', 'VILA IEDA'),
  ('Centro', 'VILA ILGENFRITZ', 'VILA ILGENFRITZ'),
  ('Cabreúva', 'VILA INDEPENDÊNCIA', 'VILA INDEPENDENCIA'),
  ('Piratininga', 'VILA IPIRANGA', 'VILA IPIRANGA'),
  ('Jardim dos Estados', 'VILA ISES', 'VILA ISES'),
  ('Taquarussu', 'VILA ITAMARATI', 'VILA ITAMARATI'),
  ('Tarumã', 'VILA JANDAIA', 'VILA JANDAIA'),
  ('Centro', 'VILA JARDIM ACLIMAÇÃO - PARTE', 'VILA JARDIM ACLIMACAO'),
  ('Bela Vista', 'VILA JARDIM ALEGRE - PARTE', 'VILA JARDIM ALEGRE'),
  ('Glória', 'VILA JARDIM ALVORADA', 'VILA JARDIM ALVORADA'),
  ('América', 'VILA JARDIM AMÉRICA', 'VILA JARDIM AMERICA'),
  ('Caiçara', 'VILA JARDIM ANAHY', 'VILA JARDIM ANAHY'),
  ('Caiçara', 'VILA JARDIM ANAHY - 2ª SEÇÃO', 'VILA JARDIM ANAHY 2 SECAO'),
  ('Santo Amaro', 'VILA JARDIM BEIJA FLOR', 'VILA JARDIM BEIJA FLOR'),
  ('Bela Vista', 'VILA JARDIM BELA VISTA', 'VILA JARDIM BELA VISTA'),
  ('Monte Líbano', 'VILA JARDIM DE ALLAH', 'VILA JARDIM DE ALLAH'),
  ('Jardim dos Estados', 'VILA JARDIM DOS ESTADOS', 'VILA JARDIM DOS ESTADOS'),
  ('Coronel Antonino', 'VILA JARDIM IMPERIAL', 'VILA JARDIM IMPERIAL'),
  ('Caiçara', 'VILA JARDIM LEBLON - PARTE', 'VILA JARDIM LEBLON'),
  ('Leblon', 'VILA JARDIM LEBLON - 2ª SEÇÃO', 'VILA JARDIM LEBLON 2 SECAO'),
  ('Seminário', 'VILA JARDIM MARIA AMÉLIA', 'VILA JARDIM MARIA AMELIA'),
  ('Pioneiros', 'VILA JARDIM PIONEIROS', 'VILA JARDIM PIONEIROS'),
  ('Tiradentes', 'VILA JARDIM SÃO BERNARDO', 'VILA JARDIM SAO BERNARDO'),
  ('Itanhangá', 'VILA JOSELITO', 'VILA JOSELITO'),
  ('Universitário', 'VILA JULIETA', 'VILA JULIETA'),
  ('Bandeirantes', 'VILA JUREMA', 'VILA JUREMA'),
  ('Leblon', 'VILA JUSSARA', 'VILA JUSSARA'),
  ('Coophavila II', 'VILA KELLEM', 'VILA KELLEM'),
  ('Coophavila II', 'VILA KELLEM - 2ª SEÇÃO', 'VILA KELLEM 2 SECAO'),
  ('Seminário', 'VILA LEDA', 'VILA LEDA'),
  ('Jardim dos Estados', 'VILA LIA', 'VILA LIA'),
  ('Glória', 'VILA LIBERDADE', 'VILA LIBERDADE'),
  ('São Francisco', 'VILA LÍDIA - PARTE', 'VILA LIDIA'),
  ('Nasser', 'VILA LILI', 'VILA LILI'),
  ('Margarida', 'VILA LUCINDA', 'VILA LUCINDA'),
  ('Dr. Albuquerque', 'VILA MACIEL - PARTE', 'VILA MACIEL'),
  ('São Conrado', 'VILA MAJOR JUARES', 'VILA MAJOR JUARES'),
  ('Jardim dos Estados', 'VILA MANDETA', 'VILA MANDETA'),
  ('Chácara Cachoeira', 'VILA MANOEL DA COSTA LIMA', 'VILA MANOEL DA COSTA LIMA'),
  ('Núcleo Industrial', 'VILA MANOEL SECCO THOMÉ', 'VILA MANOEL SECCO THOME'),
  ('Amambaí', 'VILA MARACAJU', 'VILA MARACAJU'),
  ('Margarida', 'VILA MARGARIDA', 'VILA MARGARIDA'),
  ('Jardim dos Estados', 'VILA MARIANA', 'VILA MARIANA'),
  ('Cabreúva', 'VILA MARISA', 'VILA MARISA'),
  ('Nasser', 'VILA MARLI', 'VILA MARLI'),
  ('Cruzeiro', 'VILA MARMAN', 'VILA MARMAN'),
  ('Autonomista', 'VILA MONTE CARLO', 'VILA MONTE CARLO'),
  ('Carlota', 'VILA MORUMBI', 'VILA MORUMBI'),
  ('Carlota', 'VILA MORUMBI - SEÇÃO A - PARTE', 'VILA MORUMBI SECAO A'),
  ('Rita Vieira', 'VILA MORUMBI - SEÇÃO B - PARTE', 'VILA MORUMBI SECAO B'),
  ('Carandá', 'VILA NASCENTE', 'VILA NASCENTE'),
  ('Nasser', 'VILA NASSER', 'VILA NASSER'),
  ('Nasser', 'VILA NASSER - 2ª SEÇÃO', 'VILA NASSER 2 SECAO'),
  ('Caiobá', 'VILA NATHÁLIA', 'VILA NATHALIA'),
  ('Nasser', 'VILA NEUSA', 'VILA NEUSA'),
  ('Nasser', 'VILA NILZA', 'VILA NILZA')
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ('Nasser', 'VILA NILZA - 1ª E 2ª SEÇÃO', 'VILA NILZA 1 E 2 SECAO'),
  ('Centenário', 'VILA NOGUEIRA', 'VILA NOGUEIRA'),
  ('Nasser', 'VILA NOSSA SENHORA APARECIDA', 'VILA NOSSA SENHORA APARECIDA'),
  ('Sobrinho', 'VILA NOSSA SENHORA AUXILIADORA', 'VILA NOSSA SENHORA AUXILIADORA'),
  ('Seminário', 'VILA NOSSA SENHORA DA CONCEIÇÃO', 'VILA NOSSA SENHORA DA CONCEICAO'),
  ('Carvalho', 'VILA NOSSA SENHORA DE LOURDES', 'VILA NOSSA SENHORA DE LOURDES'),
  ('Santo Antônio', 'VILA NOVA', 'VILA NOVA'),
  ('Cruzeiro', 'VILA NOVA ALVORADA', 'VILA NOVA ALVORADA'),
  ('Jacy', 'VILA NOVA BANDEIRANTE', 'VILA NOVA BANDEIRANTE'),
  ('Santa Fé', 'VILA NOVA IPANEMA', 'VILA NOVA IPANEMA'),
  ('São Bento', 'VILA NOVA SÃO BENTO', 'VILA NOVA SAO BENTO'),
  ('Nasser', 'VILA NOVO HORIZONTE', 'VILA NOVO HORIZONTE'),
  ('José Abrão', 'VILA OESTE - PARTE', 'VILA OESTE'),
  ('Amambaí', 'VILA OLGA', 'VILA OLGA'),
  ('Dr. Albuquerque', 'VILA OLINDA', 'VILA OLINDA'),
  ('Carvalho', 'VILA OLIVEIRA', 'VILA OLIVEIRA'),
  ('Jardim dos Estados', 'VILA ONZE', 'VILA ONZE'),
  ('Glória', 'VILA ORIENTE', 'VILA ORIENTE'),
  ('Glória', 'VILA ORNELAS', 'VILA ORNELAS'),
  ('Glória', 'VILA ORNELAS - SEÇÃO B', 'VILA ORNELAS SECAO B'),
  ('Amambaí', 'VILA ORPHEU BAÍS', 'VILA ORPHEU BAIS'),
  ('Autonomista', 'VILA ORSI', 'VILA ORSI'),
  ('Leblon', 'VILA OSPAMPAS', 'VILA OSPAMPAS'),
  ('Leblon', 'VILA OURO FINO', 'VILA OURO FINO'),
  ('Autonomista', 'VILA PAGÉ', 'VILA PAGE'),
  ('Santo Amaro', 'VILA PALMIRA', 'VILA PALMIRA'),
  ('Jardim dos Estados', 'VILA PARAÍSO', 'VILA PARAISO'),
  ('Jardim dos Estados', 'VILA PARAÍSO SUPLEMENTO', 'VILA PARAISO SUPLEMENTO'),
  ('Jardim dos Estados', 'VILA PAULISTANA', 'VILA PAULISTANA'),
  ('Amambaí', 'VILA PERSEVERANÇA', 'VILA PERSEVERANCA'),
  ('Planalto', 'VILA PLANALTO', 'VILA PLANALTO'),
  ('Amambaí', 'VILA PORTÃO DE FERRO', 'VILA PORTAO DE FERRO'),
  ('Carlota', 'VILA PORTINHO FREDERICO PACHE - PARTE', 'VILA PORTINHO FREDERICO PACHE'),
  ('América', 'VILA PROGRESSO - PARTE', 'VILA PROGRESSO'),
  ('Jardim Paulista', 'VILA PROGRESSO - 2ª SEÇÃO', 'VILA PROGRESSO 2 SECAO'),
  ('Dr. Albuquerque', 'VILA PROGRESSO - 3ª SEÇÃO', 'VILA PROGRESSO 3 SECAO'),
  ('Carvalho', 'VILA QUITO', 'VILA QUITO'),
  ('Chácara dos Poderes', 'VILA RAQUEL', 'VILA RAQUEL'),
  ('Itanhangá', 'VILA REZENDE', 'VILA REZENDE'),
  ('Autonomista', 'VILA RICA', 'VILA RICA'),
  ('Popular', 'VILA ROMANA', 'VILA ROMANA'),
  ('Cruzeiro', 'VILA ROSA', 'VILA ROSA'),
  ('Itanhangá', 'VILA ROSA PIRES', 'VILA ROSA PIRES'),
  ('Sobrinho', 'VILA ROSALINA', 'VILA ROSALINA'),
  ('Jardim dos Estados', 'VILA SANT'' ANA', 'VILA SANT ANA'),
  ('Jockey Club', 'VILA SANTA AMÉLIA BAÍS', 'VILA SANTA AMELIA BAIS'),
  ('São Francisco', 'VILA SANTA BÁRBARA', 'VILA SANTA BARBARA'),
  ('Pioneiros', 'VILA SANTA BRANCA', 'VILA SANTA BRANCA'),
  ('Pioneiros', 'VILA SANTA BRANCA - 2ª SEÇÃO', 'VILA SANTA BRANCA 2 SECAO'),
  ('Glória', 'VILA SANTA DOROTHÉA', 'VILA SANTA DOROTHEA'),
  ('Glória', 'VILA SANTA FILOMENA', 'VILA SANTA FILOMENA'),
  ('Seminário', 'VILA SANTA LÚCIA', 'VILA SANTA LUCIA'),
  ('Carvalho', 'VILA SANTA LUÍZA', 'VILA SANTA LUIZA'),
  ('Carvalho', 'VILA SANTA MARIA', 'VILA SANTA MARIA'),
  ('Jardim dos Estados', 'VILA SANTA ODETE', 'VILA SANTA ODETE'),
  ('Sobrinho', 'VILA SANTA RITA', 'VILA SANTA RITA'),
  ('Cabreúva', 'VILA SANTA ROSA - PARTE', 'VILA SANTA ROSA'),
  ('Planalto', 'VILA SANTA TEREZA', 'VILA SANTA TEREZA'),
  ('Jardim dos Estados', 'VILA SANTÉRIO', 'VILA SANTERIO'),
  ('Taquarussu', 'VILA SANTO AFONSO', 'VILA SANTO AFONSO'),
  ('Santo Amaro', 'VILA SANTO AMARO', 'VILA SANTO AMARO'),
  ('Monte Líbano', 'VILA SANTO ANDRÉ', 'VILA SANTO ANDRE'),
  ('Amambaí', 'VILA SANTO ANTÔNIO', 'VILA SANTO ANTONIO'),
  ('Universitário', 'VILA SANTO EUGÊNIO', 'VILA SANTO EUGENIO'),
  ('Planalto', 'VILA SANTOS', 'VILA SANTOS'),
  ('Jardim dos Estados', 'VILA SANTOS GOMES - PARTE', 'VILA SANTOS GOMES'),
  ('Seminário', 'VILA SÃO BENEDITO', 'VILA SAO BENEDITO'),
  ('Jardim dos Estados', 'VILA SÃO ELIAS', 'VILA SAO ELIAS'),
  ('São Francisco', 'VILA SÃO FRANCISCO', 'VILA SAO FRANCISCO'),
  ('Jardim dos Estados', 'VILA SÃO GABRIEL', 'VILA SAO GABRIEL'),
  ('Monte Castelo', 'VILA SÃO JOÃO BOSCO', 'VILA SAO JOAO BOSCO'),
  ('Jardim dos Estados', 'VILA SÃO JORGE', 'VILA SAO JORGE'),
  ('Carvalho', 'VILA SÃO JOSÉ', 'VILA SAO JOSE'),
  ('São Francisco', 'VILA SÃO LUIZ', 'VILA SAO LUIZ'),
  ('Planalto', 'VILA SÃO MANOEL', 'VILA SAO MANOEL'),
  ('Santo Amaro', 'VILA SÃO MARCOS', 'VILA SAO MARCOS'),
  ('Glória', 'VILA SÃO MIGUEL', 'VILA SAO MIGUEL'),
  ('Carvalho', 'VILA SÃO RAFAEL', 'VILA SAO RAFAEL'),
  ('Seminário', 'VILA SÃO ROQUE', 'VILA SAO ROQUE'),
  ('São Francisco', 'VILA SÃO SEBASTIÃO', 'VILA SAO SEBASTIAO')
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome_informado, v.nome_normalizado, 'sisgran', 100
FROM public.geo_bairros b
JOIN (VALUES
  ('São Francisco', 'VILA SÃO THOMÉ', 'VILA SAO THOME'),
  ('Amambaí', 'VILA SÃO VICENTE', 'VILA SAO VICENTE'),
  ('Seminário', 'VILA SARAIVA', 'VILA SARAIVA'),
  ('Nova Campo Grande', 'VILA SERRADINHO', 'VILA SERRADINHO'),
  ('Cruzeiro', 'VILA SILVIA', 'VILA SILVIA'),
  ('Cruzeiro', 'VILA SILVIA - 2ª SEÇÃO', 'VILA SILVIA 2 SECAO'),
  ('Santo Antônio', 'VILA SILVIA REGINA', 'VILA SILVIA REGINA'),
  ('Planalto', 'VILA SOARES', 'VILA SOARES'),
  ('Planalto', 'VILA SOARES - 1ª SEÇÃO', 'VILA SOARES 1 SECAO'),
  ('Planalto', 'VILA SOARES - 2ª SEÇÃO', 'VILA SOARES 2 SECAO'),
  ('Sobrinho', 'VILA SOBRINHO', 'VILA SOBRINHO'),
  ('Glória', 'VILA SOL NASCENTE', 'VILA SOL NASCENTE'),
  ('Chácara dos Poderes', 'VILA SÔNIA', 'VILA SONIA'),
  ('Jardim dos Estados', 'VILA SUBURBANA', 'VILA SUBURBANA'),
  ('Cruzeiro', 'VILA SUÍÇA', 'VILA SUICA'),
  ('Taveirópolis', 'VILA TAVEIRÓPOLIS', 'VILA TAVEIROPOLIS'),
  ('Chácara dos Poderes', 'VILA TELMA', 'VILA TELMA'),
  ('Coronel Antonino', 'VILA TRIÂNGULO', 'VILA TRIANGULO'),
  ('Jardim dos Estados', 'VILA TUPACERETAN', 'VILA TUPACERETAN'),
  ('América', 'VILA VALPARAÍSO', 'VILA VALPARAISO'),
  ('Vilasboas', 'VILA VILASBOAS', 'VILA VILASBOAS'),
  ('Tijuca', 'VILA VILMA', 'VILA VILMA'),
  ('Amambaí', 'VILA WARDE', 'VILA WARDE'),
  ('Jardim dos Estados', 'VILA XV DE NOVEMBRO', 'VILA XV DE NOVEMBRO'),
  ('São Lourenço', 'VILA ZOÉ', 'VILA ZOE'),
  ('Vilasboas', 'Vilasboas', 'VILASBOAS'),
  ('Coronel Antonino', 'VILLA RAVENNA', 'VILLA RAVENNA'),
  ('Caiobá', 'VILLAGIO RIVIERA', 'VILLAGIO RIVIERA'),
  ('Nova Lima', 'VILLAGIO SANTA INÊS', 'VILLAGIO SANTA INES'),
  ('Caiobá', 'VILLÁGIO VITÓRIA', 'VILLAGIO VITORIA'),
  ('Vilasboas', 'VILLAS PARK RESIDENCE', 'VILLAS PARK RESIDENCE'),
  ('Piratininga', 'VITTA BELLA', 'VITTA BELLA'),
  ('Carandá', 'VIVENDAS DO BOSQUE - PARTE', 'VIVENDAS DO BOSQUE'),
  ('Maria Aparecida Pedrossian', 'VIVENDAS DO PARQUE', 'VIVENDAS DO PARQUE'),
  ('Universitário', 'VOLPE', 'VOLPE'),
  ('Centro Oeste', 'WASHINGTON SAITO', 'WASHINGTON SAITO'),
  ('Tarumã', 'ZÉLIA GATTAI', 'ZELIA GATTAI')
) AS v(bairro_oficial, nome_informado, nome_normalizado) ON b.bairro_oficial = v.bairro_oficial AND b.ativo = true
ON CONFLICT (nome_normalizado) DO UPDATE SET
  bairro_id = EXCLUDED.bairro_id,
  nome_informado = EXCLUDED.nome_informado,
  tipo_correspondencia = 'sisgran',
  confianca = 100;

