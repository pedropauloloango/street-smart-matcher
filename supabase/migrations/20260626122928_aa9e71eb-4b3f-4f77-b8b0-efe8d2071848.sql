
-- bairros_dicionario
DROP POLICY IF EXISTS "Acesso aberto delete dicionario" ON public.bairros_dicionario;
DROP POLICY IF EXISTS "Acesso aberto insert dicionario" ON public.bairros_dicionario;
DROP POLICY IF EXISTS "Acesso aberto update dicionario" ON public.bairros_dicionario;
CREATE POLICY "Authenticated insert dicionario" ON public.bairros_dicionario FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "Authenticated update dicionario" ON public.bairros_dicionario FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Authenticated delete dicionario" ON public.bairros_dicionario FOR DELETE TO authenticated USING (true);

-- processamentos
DROP POLICY IF EXISTS "Acesso aberto delete proc" ON public.processamentos;
DROP POLICY IF EXISTS "Acesso aberto insert proc" ON public.processamentos;
DROP POLICY IF EXISTS "Acesso aberto update proc" ON public.processamentos;
CREATE POLICY "Authenticated insert proc" ON public.processamentos FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "Authenticated update proc" ON public.processamentos FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "Authenticated delete proc" ON public.processamentos FOR DELETE TO authenticated USING (true);

-- geo_bairros
DROP POLICY IF EXISTS "geo_bairros open delete" ON public.geo_bairros;
DROP POLICY IF EXISTS "geo_bairros open insert" ON public.geo_bairros;
DROP POLICY IF EXISTS "geo_bairros open update" ON public.geo_bairros;
CREATE POLICY "geo_bairros auth insert" ON public.geo_bairros FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "geo_bairros auth update" ON public.geo_bairros FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "geo_bairros auth delete" ON public.geo_bairros FOR DELETE TO authenticated USING (true);

-- geo_parcelamentos
DROP POLICY IF EXISTS "geo_parc open delete" ON public.geo_parcelamentos;
DROP POLICY IF EXISTS "geo_parc open insert" ON public.geo_parcelamentos;
DROP POLICY IF EXISTS "geo_parc open update" ON public.geo_parcelamentos;
CREATE POLICY "geo_parc auth insert" ON public.geo_parcelamentos FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "geo_parc auth update" ON public.geo_parcelamentos FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "geo_parc auth delete" ON public.geo_parcelamentos FOR DELETE TO authenticated USING (true);

-- geo_sinonimos
DROP POLICY IF EXISTS "geo_sin open delete" ON public.geo_sinonimos;
DROP POLICY IF EXISTS "geo_sin open insert" ON public.geo_sinonimos;
DROP POLICY IF EXISTS "geo_sin open update" ON public.geo_sinonimos;
CREATE POLICY "geo_sin auth insert" ON public.geo_sinonimos FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "geo_sin auth update" ON public.geo_sinonimos FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "geo_sin auth delete" ON public.geo_sinonimos FOR DELETE TO authenticated USING (true);

-- geo_resultados
DROP POLICY IF EXISTS "geo_res open delete" ON public.geo_resultados;
DROP POLICY IF EXISTS "geo_res open insert" ON public.geo_resultados;
DROP POLICY IF EXISTS "geo_res open update" ON public.geo_resultados;
CREATE POLICY "geo_res auth insert" ON public.geo_resultados FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "geo_res auth update" ON public.geo_resultados FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "geo_res auth delete" ON public.geo_resultados FOR DELETE TO authenticated USING (true);

-- geo_importacoes: writes + restrict SELECT (contains 'usuario' column)
DROP POLICY IF EXISTS "geo_imp open delete" ON public.geo_importacoes;
DROP POLICY IF EXISTS "geo_imp open insert" ON public.geo_importacoes;
DROP POLICY IF EXISTS "geo_imp open update" ON public.geo_importacoes;
DROP POLICY IF EXISTS "geo_imp open select" ON public.geo_importacoes;
CREATE POLICY "geo_imp auth select" ON public.geo_importacoes FOR SELECT TO authenticated USING (true);
CREATE POLICY "geo_imp auth insert" ON public.geo_importacoes FOR INSERT TO authenticated WITH CHECK (true);
CREATE POLICY "geo_imp auth update" ON public.geo_importacoes FOR UPDATE TO authenticated USING (true) WITH CHECK (true);
CREATE POLICY "geo_imp auth delete" ON public.geo_importacoes FOR DELETE TO authenticated USING (true);

-- Revoke anon access to geo_importacoes (table grant level)
REVOKE SELECT, INSERT, UPDATE, DELETE ON public.geo_importacoes FROM anon;
