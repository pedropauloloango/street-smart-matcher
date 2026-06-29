-- Coophasul (Correios) → parcelamento do bairro oficial Nasser + faixa CEP 79117

INSERT INTO public.geo_parcelamentos (bairro_id, parcelamento)
SELECT b.id, 'Coophasul'
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_parcelamentos p
    WHERE p.bairro_id = b.id AND p.parcelamento = 'Coophasul' AND p.ativo = true
  );

INSERT INTO public.geo_sinonimos (bairro_id, nome_informado, nome_normalizado, tipo_correspondencia, confianca)
SELECT b.id, v.nome, v.norm, 'viacep', 100
FROM public.geo_bairros b
CROSS JOIN (VALUES
  ('Coophasul', 'COOPHASUL'),
  ('Coop Hasul', 'COOP HASUL'),
  ('Vila Coophasul', 'VILA COOPHASUL')
) AS v(nome, norm)
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_sinonimos s WHERE s.nome_normalizado = v.norm
  );
INSERT INTO public.geo_bairro_ceps (bairro_id, cep_inicio, cep_fim, logradouro)
SELECT b.id, '79117000', '79117999', 'Rua Carlos Scardine'
FROM public.geo_bairros b
WHERE b.bairro_oficial = 'Nasser' AND b.ativo = true
  AND NOT EXISTS (
    SELECT 1 FROM public.geo_bairro_ceps c
    WHERE c.bairro_id = b.id AND c.cep_inicio = '79117000' AND c.ativo = true
  );
