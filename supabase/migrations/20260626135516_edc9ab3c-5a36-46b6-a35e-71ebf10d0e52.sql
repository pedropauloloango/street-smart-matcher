
-- Roles enum
CREATE TYPE public.app_role AS ENUM ('super_admin', 'admin', 'user');

-- Profiles
CREATE TABLE public.profiles (
  id UUID PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  nome_completo TEXT,
  email TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.profiles TO authenticated;
GRANT ALL ON public.profiles TO service_role;
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

-- User roles
CREATE TABLE public.user_roles (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  role public.app_role NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
  UNIQUE (user_id, role)
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.user_roles TO authenticated;
GRANT ALL ON public.user_roles TO service_role;
ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;

-- has_role
CREATE OR REPLACE FUNCTION public.has_role(_user_id UUID, _role public.app_role)
RETURNS BOOLEAN LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public AS $$
  SELECT EXISTS (SELECT 1 FROM public.user_roles WHERE user_id = _user_id AND role = _role)
$$;

-- is_admin_or_super
CREATE OR REPLACE FUNCTION public.is_admin_or_super(_user_id UUID)
RETURNS BOOLEAN LANGUAGE sql STABLE SECURITY DEFINER SET search_path = public AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.user_roles
    WHERE user_id = _user_id AND role IN ('admin','super_admin')
  )
$$;

-- Profiles policies
CREATE POLICY "Users view own profile" ON public.profiles FOR SELECT TO authenticated
  USING (auth.uid() = id OR public.is_admin_or_super(auth.uid()));
CREATE POLICY "Users update own profile" ON public.profiles FOR UPDATE TO authenticated
  USING (auth.uid() = id OR public.is_admin_or_super(auth.uid()))
  WITH CHECK (auth.uid() = id OR public.is_admin_or_super(auth.uid()));
CREATE POLICY "Admins insert profiles" ON public.profiles FOR INSERT TO authenticated
  WITH CHECK (auth.uid() = id OR public.is_admin_or_super(auth.uid()));
CREATE POLICY "Super admin delete profiles" ON public.profiles FOR DELETE TO authenticated
  USING (public.has_role(auth.uid(), 'super_admin'));

-- User roles policies
CREATE POLICY "View own roles or admin" ON public.user_roles FOR SELECT TO authenticated
  USING (auth.uid() = user_id OR public.is_admin_or_super(auth.uid()));
CREATE POLICY "Super admin manage roles insert" ON public.user_roles FOR INSERT TO authenticated
  WITH CHECK (public.has_role(auth.uid(), 'super_admin'));
CREATE POLICY "Super admin manage roles update" ON public.user_roles FOR UPDATE TO authenticated
  USING (public.has_role(auth.uid(), 'super_admin')) WITH CHECK (public.has_role(auth.uid(), 'super_admin'));
CREATE POLICY "Super admin manage roles delete" ON public.user_roles FOR DELETE TO authenticated
  USING (public.has_role(auth.uid(), 'super_admin'));

-- Updated_at trigger
CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION public.touch_updated_at();

-- Handle new user trigger
CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER LANGUAGE plpgsql SECURITY DEFINER SET search_path = public AS $$
BEGIN
  INSERT INTO public.profiles (id, nome_completo, email)
  VALUES (NEW.id, COALESCE(NEW.raw_user_meta_data->>'nome_completo', NEW.raw_user_meta_data->>'full_name', ''), NEW.email)
  ON CONFLICT (id) DO NOTHING;

  IF NEW.email_confirmed_at IS NOT NULL AND lower(NEW.email) = 'pedro.loango@hotmail.com' THEN
    INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'super_admin') ON CONFLICT DO NOTHING;
  ELSE
    INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'user') ON CONFLICT DO NOTHING;
  END IF;

  RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_user_created
  AFTER INSERT ON auth.users
  FOR EACH ROW EXECUTE FUNCTION public.handle_new_user();

-- Also handle when Pedro confirms email later
CREATE OR REPLACE FUNCTION public.grant_super_admin_on_confirm()
RETURNS TRIGGER LANGUAGE plpgsql SECURITY DEFINER SET search_path = public AS $$
BEGIN
  IF NEW.email_confirmed_at IS NOT NULL AND lower(NEW.email) = 'pedro.loango@hotmail.com' THEN
    INSERT INTO public.user_roles (user_id, role) VALUES (NEW.id, 'super_admin') ON CONFLICT DO NOTHING;
  END IF;
  RETURN NEW;
END;
$$;

CREATE TRIGGER on_auth_user_confirmed
  AFTER UPDATE OF email_confirmed_at ON auth.users
  FOR EACH ROW
  WHEN (OLD.email_confirmed_at IS NULL AND NEW.email_confirmed_at IS NOT NULL)
  EXECUTE FUNCTION public.grant_super_admin_on_confirm();
