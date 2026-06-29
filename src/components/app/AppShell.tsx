import { Link, useRouterState } from "@tanstack/react-router";
import { LogOut, Menu } from "lucide-react";
import { useState, type ReactNode } from "react";
import { Toaster } from "@/components/ui/sonner";
import { useAuth } from "@/hooks/useAuth";
import { supabase } from "@/integrations/supabase/client";
import { ADMIN_NAV, APP_NAV_SECTIONS, isNavActive } from "@/lib/app/nav";
import { Button } from "@/components/ui/button";
import { Sheet, SheetContent, SheetHeader, SheetTitle, SheetTrigger } from "@/components/ui/sheet";
import { cn } from "@/lib/utils";

function NavContent({ path, onNavigate }: { path: string; onNavigate?: () => void }) {
  const { isAdmin, rolesLoading } = useAuth();

  return (
    <nav className="flex flex-col gap-6">
      {APP_NAV_SECTIONS.map((section) => (
        <div key={section.title}>
          <p className="mb-2 px-3 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
            {section.title}
          </p>
          <div className="flex flex-col gap-0.5">
            {section.items.map((item) => {
              const active = isNavActive(path, item);
              return (
                <Link
                  key={item.to}
                  to={item.to}
                  onClick={onNavigate}
                  className={cn(
                    "flex items-center gap-2.5 rounded-lg px-3 py-2 text-sm font-medium transition-colors",
                    active
                      ? "bg-secondary text-foreground"
                      : "text-muted-foreground hover:bg-secondary/60 hover:text-foreground",
                  )}
                >
                  <item.icon className="h-4 w-4 shrink-0" />
                  {item.label}
                </Link>
              );
            })}
          </div>
        </div>
      ))}

      {isAdmin && !rolesLoading && (
        <div>
          <p className="mb-2 px-3 text-[10px] font-semibold uppercase tracking-wider text-muted-foreground">
            Administração
          </p>
          <Link
            to={ADMIN_NAV.to}
            onClick={onNavigate}
            className={cn(
              "flex items-center gap-2.5 rounded-lg px-3 py-2 text-sm font-medium transition-colors",
              isNavActive(path, ADMIN_NAV)
                ? "bg-secondary text-foreground"
                : "text-muted-foreground hover:bg-secondary/60 hover:text-foreground",
            )}
          >
            <ADMIN_NAV.icon className="h-4 w-4 shrink-0" />
            {ADMIN_NAV.label}
          </Link>
        </div>
      )}
    </nav>
  );
}

export function AppShell({ children }: { children: ReactNode }) {
  const path = useRouterState({ select: (s) => s.location.pathname });
  const wideContent = path === "/geo/resultado";
  const { user } = useAuth();
  const [mobileOpen, setMobileOpen] = useState(false);

  async function handleSignOut() {
    await supabase.auth.signOut();
    window.location.href = "/";
  }

  return (
    <div className="flex min-h-screen bg-background">
      <Toaster richColors position="top-right" />
      <aside className="hidden w-64 shrink-0 border-r border-border/60 bg-card md:flex md:flex-col">
        <div className="border-b border-border/60 p-4">
          <Link to="/processar" className="flex items-center gap-2.5">
            <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-gradient-brand text-sm font-bold text-white shadow-glow">
              B
            </div>
            <div>
              <p className="text-sm font-semibold leading-none">BairroMatch</p>
              <p className="text-[10px] uppercase tracking-wider text-muted-foreground">Campo Grande-MS</p>
            </div>
          </Link>
        </div>
        <div className="flex-1 overflow-y-auto p-3">
          <NavContent path={path} />
        </div>
        <div className="border-t border-border/60 p-3">
          <div className="mb-2 truncate px-3 text-xs text-muted-foreground">{user?.email}</div>
          <Button variant="ghost" size="sm" className="w-full justify-start gap-2" onClick={handleSignOut}>
            <LogOut className="h-4 w-4" />
            Sair
          </Button>
        </div>
      </aside>

      <div className="flex min-w-0 flex-1 flex-col">
        <header className="flex items-center justify-between border-b border-border/60 bg-background/80 px-4 py-3 backdrop-blur md:px-6">
          <div className="flex items-center gap-3">
            <Sheet open={mobileOpen} onOpenChange={setMobileOpen}>
              <SheetTrigger asChild>
                <Button variant="outline" size="icon" className="md:hidden">
                  <Menu className="h-4 w-4" />
                </Button>
              </SheetTrigger>
              <SheetContent side="left" className="w-72 p-0">
                <SheetHeader className="border-b border-border/60 p-4 text-left">
                  <SheetTitle className="flex items-center gap-2">
                    <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-gradient-brand text-xs font-bold text-white">
                      B
                    </div>
                    BairroMatch
                  </SheetTitle>
                </SheetHeader>
                <div className="p-3">
                  <NavContent path={path} onNavigate={() => setMobileOpen(false)} />
                </div>
                <div className="absolute bottom-0 left-0 right-0 border-t border-border/60 p-3">
                  <Button variant="ghost" size="sm" className="w-full justify-start gap-2" onClick={handleSignOut}>
                    <LogOut className="h-4 w-4" />
                    Sair
                  </Button>
                </div>
              </SheetContent>
            </Sheet>
            <Link to="/processar" className="flex items-center gap-2 md:hidden">
              <div className="flex h-8 w-8 items-center justify-center rounded-lg bg-gradient-brand text-xs font-bold text-white">
                B
              </div>
              <span className="text-sm font-semibold">BairroMatch</span>
            </Link>
          </div>
          <div className="hidden items-center gap-2 md:flex">
            <span className="max-w-[200px] truncate text-xs text-muted-foreground">{user?.email}</span>
            <Button variant="ghost" size="sm" className="gap-1.5" onClick={handleSignOut}>
              <LogOut className="h-3.5 w-3.5" />
              Sair
            </Button>
          </div>
          <Button variant="ghost" size="icon" className="md:hidden" onClick={handleSignOut}>
            <LogOut className="h-4 w-4" />
          </Button>
        </header>

        <main
          className={cn(
            "flex-1 min-w-0 px-4 py-6 sm:px-6 md:py-8",
            wideContent ? "overflow-x-auto" : "overflow-x-hidden",
          )}
        >
          <div
            className={cn(
              "mx-auto w-full",
              wideContent ? "max-w-none min-w-[72rem]" : "max-w-7xl",
            )}
          >
            {children}
          </div>
        </main>
      </div>
    </div>
  );
}
