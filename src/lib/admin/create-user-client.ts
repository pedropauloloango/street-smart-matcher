import { supabase } from "@/integrations/supabase/client";
import type { AppRole } from "@/hooks/useAuth";

export type CreateUserInput = {
  nome: string;
  email: string;
  senha: string;
  role: AppRole;
};

export function getErrorMessage(err: unknown): string {
  if (err instanceof Error) return err.message;
  if (typeof err === "object" && err !== null && "message" in err) {
    return String((err as { message: unknown }).message);
  }
  return "Erro desconhecido.";
}

export function isMissingServiceRoleError(message: string): boolean {
  const lower = message.toLowerCase();
  return (
    lower.includes("service_role_key") ||
    lower.includes("missing supabase environment") ||
    lower.includes("connect supabase in lovable")
  );
}

/** Cadastro via cliente preservando a sessão do admin (fallback sem service role). */
export async function createUserViaClient(input: CreateUserInput, isSuperAdmin: boolean) {
  const {
    data: { session: adminSession },
  } = await supabase.auth.getSession();
  if (!adminSession) throw new Error("Sessão expirada. Faça login novamente.");

  const { data, error } = await supabase.auth.signUp({
    email: input.email.trim(),
    password: input.senha,
    options: { data: { nome_completo: input.nome.trim() } },
  });

  const { error: restoreErr } = await supabase.auth.setSession({
    access_token: adminSession.access_token,
    refresh_token: adminSession.refresh_token,
  });
  if (restoreErr) {
    throw new Error("Usuário pode ter sido criado, mas sua sessão foi interrompida. Faça login novamente.");
  }

  if (error) {
    const msg = error.message.toLowerCase();
    if (msg.includes("already") || msg.includes("registered") || msg.includes("exists")) {
      throw new Error("Este e-mail já está cadastrado.");
    }
    throw new Error(error.message);
  }

  const newUserId = data.user?.id;
  if (!newUserId) throw new Error("Não foi possível criar o usuário.");

  if (input.role !== "user") {
    if (!isSuperAdmin) {
      throw new Error("Apenas super admin pode atribuir papéis de administrador.");
    }
    await supabase.from("user_roles").delete().eq("user_id", newUserId);
    const { error: roleErr } = await supabase
      .from("user_roles")
      .insert({ user_id: newUserId, role: input.role });
    if (roleErr) throw new Error(roleErr.message);
  }

  return {
    id: newUserId,
    email: input.email.trim(),
    nome: input.nome.trim(),
    role: input.role,
  };
}
