import { createFileRoute, Link, Outlet, useRouterState } from "@tanstack/react-router";
import { MapPin } from "lucide-react";
import { GEO_NAV_ITEMS, isGeoNavActive } from "@/lib/geo/nav";

export const Route = createFileRoute("/geo")({
  component: GeoLayout,
});

const items = GEO_NAV_ITEMS;

function GeoLayout() {
  const path = useRouterState({ select: (s) => s.location.pathname });
  return (
    <div className="grid grid-cols-1 gap-6 md:grid-cols-[240px_1fr]">
      <aside className="rounded-xl border border-border bg-card p-4">
        <div className="mb-4 flex items-center gap-2">
          <div className="flex h-9 w-9 items-center justify-center rounded-lg bg-gradient-brand text-white shadow-glow">
            <MapPin className="h-4 w-4" />
          </div>
          <div>
            <p className="text-sm font-semibold leading-none">GeoBairros CG</p>
            <p className="text-[10px] uppercase tracking-wider text-muted-foreground">Campo Grande-MS</p>
          </div>
        </div>
        <nav className="flex flex-col gap-1">
          {items.map((it) => {
            const active = isGeoNavActive(path, it);
            return (
              <Link
                key={it.to}
                to={it.to}
                className={
                  "flex items-center gap-2 rounded-md px-3 py-2 text-sm font-medium transition-colors " +
                  (active ? "bg-secondary text-foreground" : "text-muted-foreground hover:bg-secondary/60 hover:text-foreground")
                }
              >
                <it.icon className="h-4 w-4" />
                {it.label}
              </Link>
            );
          })}
        </nav>
      </aside>
      <section className="min-w-0">
        <Outlet />
      </section>
    </div>
  );
}
