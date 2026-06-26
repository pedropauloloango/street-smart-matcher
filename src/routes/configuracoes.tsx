import { createFileRoute, useNavigate } from "@tanstack/react-router";
import { useEffect, useState, useCallback } from "react";
import { supabase } from "@/integrations/supabase/client";
import { useAuth, type AppRole } from "@/hooks/useAuth";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import {
  Select, SelectContent, SelectItem, SelectTrigger, SelectValue,
} from "@/components/ui/select";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { toast } from "sonner";

export const Route = createFileRoute("/configuracoes")({
  component: ConfigPage,
});

type Row = { id: string; email: string | null; nome_completo: string | null; role: AppRole };

function ConfigPage() {
  const navigate = useNavigate();
  const { user, isAdmin, isSuperAdmin, loading } = useAuth();
  const [rows, setRows] = useState<Row[]>([]);
  const [nome, setNome] = useState("");
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const [role, setRole] = useState<AppRole>("user");
  const [creating, setCreating] = useState(false);

  useEffect(() => {
    if (!loading && !user) navigate({ to: "/auth" });
    if (!loading && user && !isAdmin) navigate({ to: "/" });
  }, [user, isAdmin, loading, navigate]);

  const load = useCallback(async () => {
    const { data: profiles } = await supabase
      .from("profiles").select("id,email,nome_completo");
    const { data: rolesData } = await supabase
      .from("user_roles").select("user_id,role");
    const roleMap = new Map<string, AppRole>();
    (rolesData ?? []).forEach((r) => {
      const existing = roleMap.get(r.user_id);
      const rank: Record<AppRole, number> = { super_admin: 3, admin: 2, user: 1 };
      if (!existing || rank[r.role as AppRole] > rank[existing]) {
        roleMap.set(r.user_id, r.role as AppRole);
      }
    });
    setRows((profiles ?? []).map((p) => ({
      id: p.id, email: p.email, nome_completo: p.nome_completo,
      role: roleMap.get(p.id) ?? "user",
    })));
  }, []);

  useEffect(() => { if (isAdmin) load(); }, [isAdmin, load]);

  async function createUser(e: React.FormEvent) {
    e.preventDefault();
    setCreating(true);
    const { data, error } = await supabase.auth.signUp({
      email, password: senha,
      options: { data: { nome_completo: nome } },
    });
    if (error) { toast.error(error.message); setCreating(false); return; }
    if (data.user && role !== "user" && isSuperAdmin) {
      await supabase.from("user_roles").insert({ user_id: data.user.id, role });
    }
    toast.success("Usuário cadastrado");
    setNome(""); setEmail(""); setSenha(""); setRole("user");
    setCreating(false);
    load();
  }

  async function changeRole(userId: string, newRole: AppRole) {
    await supabase.from("user_roles").delete().eq("user_id", userId);
    const { error } = await supabase.from("user_roles").insert({ user_id: userId, role: newRole });
    if (error) toast.error(error.message); else toast.success("Papel atualizado");
    load();
  }

  if (loading || !user || !isAdmin) return null;

  return (
    <div className="space-y-6">
      <Card>
        <CardHeader>
          <CardTitle>Cadastrar novo usuário</CardTitle>
          <CardDescription>Os novos usuários compartilham a mesma base de dados.</CardDescription>
        </CardHeader>
        <CardContent>
          <form onSubmit={createUser} className="grid gap-3 sm:grid-cols-2">
            <div><Label>Nome completo</Label><Input value={nome} onChange={(e) => setNome(e.target.value)} required /></div>
            <div><Label>Email</Label><Input type="email" value={email} onChange={(e) => setEmail(e.target.value)} required /></div>
            <div><Label>Senha</Label><Input type="password" value={senha} onChange={(e) => setSenha(e.target.value)} required minLength={6} /></div>
            <div>
              <Label>Papel</Label>
              <Select value={role} onValueChange={(v) => setRole(v as AppRole)}>
                <SelectTrigger><SelectValue /></SelectTrigger>
                <SelectContent>
                  <SelectItem value="user">Usuário</SelectItem>
                  <SelectItem value="admin" disabled={!isSuperAdmin}>Admin</SelectItem>
                  <SelectItem value="super_admin" disabled={!isSuperAdmin}>Super Admin</SelectItem>
                </SelectContent>
              </Select>
            </div>
            <div className="sm:col-span-2">
              <Button type="submit" disabled={creating}>{creating ? "Cadastrando..." : "Cadastrar"}</Button>
            </div>
          </form>
        </CardContent>
      </Card>

      <Card>
        <CardHeader><CardTitle>Usuários</CardTitle></CardHeader>
        <CardContent>
          <Table>
            <TableHeader>
              <TableRow><TableHead>Nome</TableHead><TableHead>Email</TableHead><TableHead>Papel</TableHead></TableRow>
            </TableHeader>
            <TableBody>
              {rows.map((r) => (
                <TableRow key={r.id}>
                  <TableCell>{r.nome_completo || "—"}</TableCell>
                  <TableCell>{r.email}</TableCell>
                  <TableCell>
                    {isSuperAdmin ? (
                      <Select value={r.role} onValueChange={(v) => changeRole(r.id, v as AppRole)}>
                        <SelectTrigger className="w-40"><SelectValue /></SelectTrigger>
                        <SelectContent>
                          <SelectItem value="user">Usuário</SelectItem>
                          <SelectItem value="admin">Admin</SelectItem>
                          <SelectItem value="super_admin">Super Admin</SelectItem>
                        </SelectContent>
                      </Select>
                    ) : r.role}
                  </TableCell>
                </TableRow>
              ))}
            </TableBody>
          </Table>
        </CardContent>
      </Card>
    </div>
  );
}
