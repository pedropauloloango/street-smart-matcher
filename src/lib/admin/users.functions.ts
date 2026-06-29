import { createServerFn } from "@tanstack/react-start";
import { z } from "zod";
import { requireSupabaseAuth } from "@/integrations/supabase/auth-middleware";
import type { AppRole } from "@/hooks/useAuth";

const appRoleSchema = z.enum(["super_admin", "admin", "user"]);

const createUserSchema = z.object({
  nome: z.string().trim().min(2, "Informe o nome completo."),
  email: z.string().trim().email("Informe um e-mail válido."),
  senha: z.string().min(6, "A senha deve ter pelo menos 6 caracteres."),
  role: appRoleSchema,
});

export type CreateAppUserInput = z.infer<typeof createUserSchema>;

export const createAppUser = createServerFn({ method: "POST" })
  .inputValidator(createUserSchema)
  .middleware([requireSupabaseAuth])
  .handler(async ({ data, context }) => {
    const { supabase, userId } = context as {
      supabase: import("@supabase/supabase-js").SupabaseClient;
      userId: string;
    };

    const { data: callerIsAdmin, error: adminErr } = await supabase.rpc("is_admin_or_super", {
      _user_id: userId,
    });
    if (adminErr) throw new Error(adminErr.message);
    if (!callerIsAdmin) throw new Error("Sem permissão para cadastrar usuários.");

    const { data: callerIsSuperAdmin, error: superErr } = await supabase.rpc("has_role", {
      _user_id: userId,
      _role: "super_admin",
    });
    if (superErr) throw new Error(superErr.message);

    if (data.role !== "user" && !callerIsSuperAdmin) {
      throw new Error("Apenas super admin pode atribuir papéis de administrador.");
    }

    const { supabaseAdmin } = await import("@/integrations/supabase/client.server");

    const { data: created, error: createErr } = await supabaseAdmin.auth.admin.createUser({
      email: data.email,
      password: data.senha,
      email_confirm: true,
      user_metadata: { nome_completo: data.nome },
    });

    if (createErr) {
      const msg = createErr.message.toLowerCase();
      if (msg.includes("already") || msg.includes("registered") || msg.includes("exists")) {
        throw new Error("Este e-mail já está cadastrado.");
      }
      throw new Error(createErr.message);
    }

    const newUserId = created.user?.id;
    if (!newUserId) throw new Error("Não foi possível criar o usuário.");

    await supabaseAdmin
      .from("profiles")
      .upsert({ id: newUserId, nome_completo: data.nome, email: data.email }, { onConflict: "id" });

    if (data.role !== "user") {
      await supabaseAdmin.from("user_roles").delete().eq("user_id", newUserId);
      const { error: roleErr } = await supabaseAdmin
        .from("user_roles")
        .insert({ user_id: newUserId, role: data.role });
      if (roleErr) throw new Error(roleErr.message);
    }

    return {
      id: newUserId,
      email: data.email,
      nome: data.nome,
      role: data.role,
    };
  });

const changeRoleSchema = z.object({
  userId: z.string().uuid(),
  role: appRoleSchema,
});

export const changeAppUserRole = createServerFn({ method: "POST" })
  .inputValidator(changeRoleSchema)
  .middleware([requireSupabaseAuth])
  .handler(async ({ data, context }) => {
    const { supabase, userId } = context as {
      supabase: import("@supabase/supabase-js").SupabaseClient;
      userId: string;
    };

    const { data: callerIsSuperAdmin, error: superErr } = await supabase.rpc("has_role", {
      _user_id: userId,
      _role: "super_admin",
    });
    if (superErr) throw new Error(superErr.message);
    if (!callerIsSuperAdmin) throw new Error("Apenas super admin pode alterar papéis.");

    if (data.userId === userId && data.role !== "super_admin") {
      throw new Error("Você não pode remover seu próprio acesso de super admin.");
    }

    const { supabaseAdmin } = await import("@/integrations/supabase/client.server");

    await supabaseAdmin.from("user_roles").delete().eq("user_id", data.userId);
    const { error: roleErr } = await supabaseAdmin
      .from("user_roles")
      .insert({ user_id: data.userId, role: data.role as AppRole });
    if (roleErr) throw new Error(roleErr.message);

    return { userId: data.userId, role: data.role };
  });
