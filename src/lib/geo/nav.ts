import type { LucideIcon } from "lucide-react";
import { Database, Download, LayoutDashboard, Table2, Upload, Wand2 } from "lucide-react";

export type GeoNavItem = {
  to: string;
  label: string;
  icon: LucideIcon;
  exact?: boolean;
};

export const GEO_NAV_ITEMS: GeoNavItem[] = [
  { to: "/geo", label: "Dashboard", icon: LayoutDashboard, exact: true },
  { to: "/geo/base", label: "Base Oficial", icon: Database },
  { to: "/geo/importar", label: "Importar Planilha", icon: Upload },
  { to: "/geo/normalizacao", label: "Normalização", icon: Wand2 },
  { to: "/geo/resultado", label: "Resultado", icon: Table2 },
  { to: "/geo/exportacoes", label: "Exportações", icon: Download },
];

export function isGeoPath(path: string): boolean {
  return path === "/geo" || path.startsWith("/geo/");
}

export function isGeoNavActive(path: string, item: GeoNavItem): boolean {
  return item.exact ? path === item.to : path === item.to || path.startsWith(item.to + "/");
}
