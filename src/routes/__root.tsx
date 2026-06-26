import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import {
  Outlet,
  Link,
  createRootRouteWithContext,
  useRouter,
  useRouterState,
  HeadContent,
  Scripts,
} from "@tanstack/react-router";
import { useEffect, type ReactNode } from "react";

import appCss from "../styles.css?url";
import { reportLovableError } from "../lib/lovable-error-reporting";
import { Button } from "@/components/ui/button";
import { AuthProvider } from "@/hooks/useAuth";

function NotFoundComponent() {
  return (
    <div className="flex min-h-screen items-center justify-center bg-background px-4">
      <div className="max-w-md text-center">
        <h1 className="text-7xl font-bold text-foreground">404</h1>
        <h2 className="mt-4 text-xl font-semibold">Página não encontrada</h2>
        <p className="mt-2 text-sm text-muted-foreground">A página que você procura não existe ou foi movida.</p>
        <div className="mt-6">
          <Link to="/" className="inline-flex items-center justify-center rounded-md bg-primary px-4 py-2 text-sm font-medium text-primary-foreground hover:bg-primary/90">
            Voltar ao início
          </Link>
        </div>
      </div>
    </div>
  );
}

function ErrorComponent({ error, reset }: { error: Error; reset: () => void }) {
  console.error(error);
  const router = useRouter();
  useEffect(() => {
    reportLovableError(error, { boundary: "tanstack_root_error_component" });
  }, [error]);

  return (
    <div className="flex min-h-screen items-center justify-center bg-background px-4">
      <div className="max-w-md text-center">
        <h1 className="text-xl font-semibold">Algo deu errado</h1>
        <p className="mt-2 text-sm text-muted-foreground">Tente recarregar a página.</p>
        <div className="mt-6 flex justify-center gap-2">
          <button
            onClick={() => { router.invalidate(); reset(); }}
            className="rounded-md bg-primary px-4 py-2 text-sm font-medium text-primary-foreground hover:bg-primary/90"
          >
            Tentar novamente
          </button>
          <a href="/" className="rounded-md border border-input bg-background px-4 py-2 text-sm font-medium hover:bg-accent/30">Início</a>
        </div>
      </div>
    </div>
  );
}

export const Route = createRootRouteWithContext<{ queryClient: QueryClient }>()({
  head: () => ({
    meta: [
      { charSet: "utf-8" },
      { name: "viewport", content: "width=device-width, initial-scale=1" },
      { title: "BairroMatch · Conciliação de bairros Campo Grande-MS" },
      { name: "description", content: "Plataforma para conciliar bairros da Receita Federal com SISGRAN e normalizar endereços com a base oficial de Campo Grande-MS." },
      { name: "author", content: "BairroMatch" },
      { property: "og:title", content: "BairroMatch · Conciliação de bairros Campo Grande-MS" },
      { property: "og:description", content: "Plataforma para conciliar bairros da Receita Federal com SISGRAN e normalizar endereços com a base oficial de Campo Grande-MS." },
      { property: "og:type", content: "website" },
      { name: "twitter:card", content: "summary" },
      { name: "twitter:title", content: "BairroMatch · Conciliação de bairros Campo Grande-MS" },
      { name: "twitter:description", content: "Plataforma para conciliar bairros da Receita Federal com SISGRAN e normalizar endereços com a base oficial de Campo Grande-MS." },
      { property: "og:image", content: "https://pub-bb2e103a32db4e198524a2e9ed8f35b4.r2.dev/af17c8a2-8b07-4575-8d23-f5f4a451963f/id-preview-10bbe5b2--32d161a1-1bd5-4d88-bce1-0f446fb6d395.lovable.app-1782477057457.png" },
      { name: "twitter:image", content: "https://pub-bb2e103a32db4e198524a2e9ed8f35b4.r2.dev/af17c8a2-8b07-4575-8d23-f5f4a451963f/id-preview-10bbe5b2--32d161a1-1bd5-4d88-bce1-0f446fb6d395.lovable.app-1782477057457.png" },
    ],
    links: [
      { rel: "stylesheet", href: appCss },
      { rel: "preconnect", href: "https://fonts.googleapis.com" },
      { rel: "preconnect", href: "https://fonts.gstatic.com", crossOrigin: "anonymous" },
      { rel: "stylesheet", href: "https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap" },
    ],
  }),
  shellComponent: RootShell,
  component: RootComponent,
  notFoundComponent: NotFoundComponent,
  errorComponent: ErrorComponent,
});

function RootShell({ children }: { children: ReactNode }) {
  return (
    <html lang="pt-BR">
      <head>
        <HeadContent />
      </head>
      <body>
        {children}
        <Scripts />
      </body>
    </html>
  );
}

function PublicHeader({ showLogin = true }: { showLogin?: boolean }) {
  return (
    <header className="sticky top-0 z-30 border-b border-border/60 bg-background/80 backdrop-blur">
      <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-3 sm:px-6">
        <Link to="/" className="flex items-center gap-2">
          <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-gradient-brand text-white font-bold shadow-glow">
            B
          </div>
          <div>
            <p className="text-sm font-semibold leading-none">BairroMatch</p>
            <p className="text-[10px] uppercase tracking-wider text-muted-foreground">Campo Grande-MS</p>
          </div>
        </Link>
        {showLogin ? (
          <Button asChild size="sm">
            <Link to="/auth">Entrar</Link>
          </Button>
        ) : (
          <Button asChild variant="ghost" size="sm">
            <Link to="/">Voltar</Link>
          </Button>
        )}
      </div>
    </header>
  );
}

function PublicFooter() {
  return (
    <footer className="border-t border-border/60 py-6 text-center text-xs text-muted-foreground">
      BairroMatch · Conciliação de bairros Receita ↔ SISGRAN · GeoBairros CG
    </footer>
  );
}

function RootComponent() {
  const { queryClient } = Route.useRouteContext();
  const pathname = useRouterState({ select: (s) => s.location.pathname });
  const isLanding = pathname === "/";
  const isAuth = pathname === "/auth";
  const isPublic = isLanding || isAuth;

  return (
    <QueryClientProvider client={queryClient}>
      <AuthProvider>
        <div className="min-h-screen">
        {isPublic ? (
          <>
            <PublicHeader showLogin={isLanding} />
            <main className={isAuth ? "mx-auto max-w-7xl px-4 py-8 sm:px-6" : undefined}>
              <Outlet />
            </main>
            {isLanding && <PublicFooter />}
          </>
        ) : (
          <Outlet />
        )}
        </div>
      </AuthProvider>
    </QueryClientProvider>
  );
}
