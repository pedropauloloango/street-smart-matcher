import { createFileRoute, useNavigate } from "@tanstack/react-router";

import { useEffect, useState, useCallback } from "react";

import { supabase } from "@/integrations/supabase/client";

import { useAuth, type AppRole } from "@/hooks/useAuth";

import { createAppUser } from "@/lib/admin/users.functions";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";

import { Button } from "@/components/ui/button";

import {

  Select, SelectContent, SelectItem, SelectTrigger, SelectValue,

} from "@/components/ui/select";

import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";

import { Input } from "@/components/ui/input";

import { Label } from "@/components/ui/label";

import { Badge } from "@/components/ui/badge";

import { Alert, AlertDescription, AlertTitle } from "@/components/ui/alert";

import { toast } from "sonner";
import { Info, Loader2, Users } from "lucide-react";
import { createUserViaClient, getErrorMessage, isMissingServiceRoleError } from "@/lib/admin/create-user-client";



export const Route = createFileRoute("/_app/configuracoes")({

  component: ConfigPage,

});



type Row = { id: string; email: string | null; nome_completo: string | null; role: AppRole };



const ROLE_LABELS: Record<AppRole, string> = {

  user: "Usuário",

  admin: "Admin",

  super_admin: "Super Admin",

};



function ConfigPage() {

  const navigate = useNavigate();

  const { user, isAdmin, isSuperAdmin, loading, rolesLoading } = useAuth();

  const [rows, setRows] = useState<Row[]>([]);

  const [loadingUsers, setLoadingUsers] = useState(true);

  const [nome, setNome] = useState("");

  const [email, setEmail] = useState("");

  const [senha, setSenha] = useState("");

  const [confirmarSenha, setConfirmarSenha] = useState("");

  const [role, setRole] = useState<AppRole>("user");

  const [creating, setCreating] = useState(false);
  const [formError, setFormError] = useState<string | null>(null);

  const [changingRoleId, setChangingRoleId] = useState<string | null>(null);



  useEffect(() => {

    if (loading || rolesLoading) return;

    if (!user) navigate({ to: "/auth" });

    else if (!isAdmin) navigate({ to: "/processar" });

  }, [user, isAdmin, loading, rolesLoading, navigate]);



  const load = useCallback(async () => {

    setLoadingUsers(true);

    try {

      const { data: profiles, error: profilesErr } = await supabase

        .from("profiles")

        .select("id,email,nome_completo")

        .order("nome_completo", { ascending: true });

      if (profilesErr) throw profilesErr;



      const { data: rolesData, error: rolesErr } = await supabase

        .from("user_roles")

        .select("user_id,role");

      if (rolesErr) throw rolesErr;



      const roleMap = new Map<string, AppRole>();

      (rolesData ?? []).forEach((r) => {

        const existing = roleMap.get(r.user_id);

        const rank: Record<AppRole, number> = { super_admin: 3, admin: 2, user: 1 };

        if (!existing || rank[r.role as AppRole] > rank[existing]) {

          roleMap.set(r.user_id, r.role as AppRole);

        }

      });



      setRows(

        (profiles ?? []).map((p) => ({

          id: p.id,

          email: p.email,

          nome_completo: p.nome_completo,

          role: roleMap.get(p.id) ?? "user",

        })),

      );

    } catch (e: unknown) {

      const message = e instanceof Error ? e.message : "Erro ao carregar usuários.";

      toast.error(message);

    } finally {

      setLoadingUsers(false);

    }

  }, []);



  useEffect(() => {

    if (isAdmin) load();

  }, [isAdmin, load]);



  async function handleCreateUser(e: React.FormEvent) {

    e.preventDefault();

    if (senha !== confirmarSenha) {

      toast.error("As senhas não coincidem.");

      return;

    }



    setCreating(true);
    setFormError(null);

    try {
      const payload = { nome: nome.trim(), email: email.trim(), senha, role };

      try {
        await createAppUser({ data: payload });
      } catch (serverErr) {
        const serverMessage = getErrorMessage(serverErr);
        if (isMissingServiceRoleError(serverMessage)) {
          await createUserViaClient(payload, isSuperAdmin);
        } else {
          throw serverErr;
        }
      }

      toast.success(`Usuário ${email.trim()} cadastrado. Ele já pode entrar com a senha definida.`);

      setNome("");

      setEmail("");

      setSenha("");

      setConfirmarSenha("");

      setRole("user");

      await load();

    } catch (e: unknown) {
      const message = getErrorMessage(e);
      setFormError(message);
      toast.error(message);

    } finally {

      setCreating(false);

    }

  }



  async function handleChangeRole(userId: string, newRole: AppRole) {

    setChangingRoleId(userId);

    try {
      await supabase.from("user_roles").delete().eq("user_id", userId);
      const { error } = await supabase.from("user_roles").insert({ user_id: userId, role: newRole });
      if (error) throw error;
      toast.success("Papel atualizado.");

      await load();

    } catch (e: unknown) {

      const message = e instanceof Error ? e.message : "Erro ao atualizar papel.";

      toast.error(message);

    } finally {

      setChangingRoleId(null);

    }

  }



  if (loading || rolesLoading || !user || !isAdmin) return null;



  return (

    <div className="space-y-6">

      <div>

        <h1 className="text-2xl font-bold">Configurações</h1>

        <p className="mt-1 text-sm text-muted-foreground">

          Gerencie quem pode acessar a plataforma e a base de dados compartilhada.

        </p>

      </div>



      <Alert>

        <Info className="h-4 w-4" />

        <AlertTitle>Base de dados compartilhada</AlertTitle>

        <AlertDescription>

          Todos os usuários cadastrados acessam os mesmos dados: dicionário de bairros, histórico de

          processamentos, importações GeoBairros e correções manuais. Novos usuários entram com acesso

          imediato após o cadastro — não é necessário confirmar e-mail.

        </AlertDescription>

      </Alert>



      <Card>

        <CardHeader>

          <CardTitle>Cadastrar novo usuário</CardTitle>

          <CardDescription>

            Crie uma conta com e-mail e senha. O usuário poderá entrar em{" "}

            <span className="font-medium">/auth</span> e acessar as mesmas informações da equipe.

          </CardDescription>

        </CardHeader>

        <CardContent>

          <form onSubmit={handleCreateUser} className="grid gap-4 sm:grid-cols-2">

            <div className="space-y-1.5">

              <Label htmlFor="nome">Nome completo</Label>

              <Input

                id="nome"

                value={nome}

                onChange={(e) => setNome(e.target.value)}

                placeholder="Nome do usuário"

                required

              />

            </div>

            <div className="space-y-1.5">

              <Label htmlFor="email">E-mail</Label>

              <Input

                id="email"

                type="email"

                value={email}

                onChange={(e) => setEmail(e.target.value)}

                placeholder="usuario@empresa.com"

                required

              />

            </div>

            <div className="space-y-1.5">

              <Label htmlFor="senha">Senha</Label>

              <Input

                id="senha"

                type="password"

                value={senha}

                onChange={(e) => setSenha(e.target.value)}

                placeholder="Mínimo 6 caracteres"

                required

                minLength={6}

              />

            </div>

            <div className="space-y-1.5">

              <Label htmlFor="confirmarSenha">Confirmar senha</Label>

              <Input

                id="confirmarSenha"

                type="password"

                value={confirmarSenha}

                onChange={(e) => setConfirmarSenha(e.target.value)}

                placeholder="Repita a senha"

                required

                minLength={6}

              />

            </div>

            <div className="space-y-1.5">

              <Label>Papel</Label>

              <Select value={role} onValueChange={(v) => setRole(v as AppRole)}>

                <SelectTrigger>

                  <SelectValue />

                </SelectTrigger>

                <SelectContent>

                  <SelectItem value="user">Usuário — acessa conciliações e GeoBairros</SelectItem>

                  <SelectItem value="admin" disabled={!isSuperAdmin}>

                    Admin — gerencia usuários e configurações

                  </SelectItem>

                  <SelectItem value="super_admin" disabled={!isSuperAdmin}>

                    Super Admin — controle total, inclusive papéis

                  </SelectItem>

                </SelectContent>

              </Select>

              {!isSuperAdmin && (

                <p className="text-xs text-muted-foreground">

                  Como admin, você pode cadastrar apenas usuários com papel Usuário.

                </p>

              )}

            </div>

            <div className="flex flex-col gap-2 sm:col-span-2">
              {formError && (
                <p className="text-sm text-destructive" role="alert">
                  {formError}
                </p>
              )}
              <Button type="submit" disabled={creating} className="gap-2 w-fit">

                {creating ? <Loader2 className="h-4 w-4 animate-spin" /> : null}

                {creating ? "Cadastrando…" : "Cadastrar usuário"}

              </Button>

            </div>

          </form>

        </CardContent>

      </Card>



      <Card>

        <CardHeader className="flex flex-row items-center justify-between space-y-0">

          <div>

            <CardTitle>Usuários cadastrados</CardTitle>

            <CardDescription>{rows.length} conta(s) com acesso à plataforma</CardDescription>

          </div>

          <Users className="h-5 w-5 text-muted-foreground" />

        </CardHeader>

        <CardContent>

          {loadingUsers ? (

            <div className="flex items-center justify-center gap-2 py-10 text-sm text-muted-foreground">

              <Loader2 className="h-4 w-4 animate-spin" />

              Carregando usuários…

            </div>

          ) : rows.length === 0 ? (

            <p className="py-10 text-center text-sm text-muted-foreground">

              Nenhum usuário cadastrado ainda.

            </p>

          ) : (

            <div className="overflow-x-auto rounded-lg border border-border/60">

              <Table>

                <TableHeader>

                  <TableRow>

                    <TableHead>Nome</TableHead>

                    <TableHead>E-mail</TableHead>

                    <TableHead>Papel</TableHead>

                  </TableRow>

                </TableHeader>

                <TableBody>

                  {rows.map((r) => (

                    <TableRow key={r.id}>

                      <TableCell className="font-medium">{r.nome_completo || "—"}</TableCell>

                      <TableCell>{r.email}</TableCell>

                      <TableCell>

                        {isSuperAdmin ? (

                          <Select

                            value={r.role}

                            disabled={changingRoleId === r.id}

                            onValueChange={(v) => handleChangeRole(r.id, v as AppRole)}

                          >

                            <SelectTrigger className="w-44">

                              <SelectValue />

                            </SelectTrigger>

                            <SelectContent>

                              <SelectItem value="user">Usuário</SelectItem>

                              <SelectItem value="admin">Admin</SelectItem>

                              <SelectItem value="super_admin">Super Admin</SelectItem>

                            </SelectContent>

                          </Select>

                        ) : (

                          <Badge variant="secondary">{ROLE_LABELS[r.role]}</Badge>

                        )}

                      </TableCell>

                    </TableRow>

                  ))}

                </TableBody>

              </Table>

            </div>

          )}

        </CardContent>

      </Card>

    </div>

  );

}

