import { Link, useRouterState } from "@tanstack/react-router";
import { ChevronDown, MapPin } from "lucide-react";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { GEO_NAV_ITEMS, isGeoNavActive, isGeoPath } from "@/lib/geo/nav";
import { cn } from "@/lib/utils";

export function GeoHeaderNav() {
  const path = useRouterState({ select: (s) => s.location.pathname });
  const active = isGeoPath(path);

  return (
    <DropdownMenu>
      <DropdownMenuTrigger
        className={cn(
          "inline-flex items-center gap-1.5 rounded-md px-3 py-1.5 text-sm font-medium outline-none transition-colors",
          active
            ? "bg-secondary text-foreground"
            : "text-muted-foreground hover:bg-secondary hover:text-foreground",
        )}
      >
        <MapPin className="h-4 w-4" />
        <span className="hidden sm:inline">GeoBairros CG</span>
        <span className="sm:hidden">Geo</span>
        <ChevronDown className="h-3.5 w-3.5 opacity-60" />
      </DropdownMenuTrigger>
      <DropdownMenuContent align="end" className="w-52">
        {GEO_NAV_ITEMS.map((item) => {
          const itemActive = isGeoNavActive(path, item);
          return (
            <DropdownMenuItem key={item.to} asChild className={itemActive ? "bg-secondary/60" : undefined}>
              <Link to={item.to} className="flex cursor-pointer items-center gap-2">
                <item.icon className="h-4 w-4" />
                {item.label}
              </Link>
            </DropdownMenuItem>
          );
        })}
      </DropdownMenuContent>
    </DropdownMenu>
  );
}
