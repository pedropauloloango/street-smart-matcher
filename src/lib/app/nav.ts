import type { LucideIcon } from "lucide-react";
import { BookOpen, History, Play, Settings } from "lucide-react";
import { GEO_NAV_ITEMS, type GeoNavItem } from "@/lib/geo/nav";

export type AppNavItem = {
  to: string;
  label: string;
  icon: LucideIcon;
  exact?: boolean;
  adminOnly?: boolean;
};

export type AppNavSection = {
  title: string;
  items: AppNavItem[];
};

export const BAIRROMATCH_NAV: AppNavItem[] = [
  { to: "/processar", label: "Processar", icon: Play },
  { to: "/historico", label: "Histórico", icon: History },
  { to: "/dicionario", label: "Dicionário", icon: BookOpen },
];

export const GEO_NAV: AppNavItem[] = GEO_NAV_ITEMS.map((item: GeoNavItem) => ({
  to: item.to,
  label: item.label,
  icon: item.icon,
  exact: item.exact,
}));

export const APP_NAV_SECTIONS: AppNavSection[] = [
  { title: "BairroMatch", items: BAIRROMATCH_NAV },
  { title: "GeoBairros CG", items: GEO_NAV },
];

export const ADMIN_NAV: AppNavItem = {
  to: "/configuracoes",
  label: "Configurações",
  icon: Settings,
  adminOnly: true,
};

export function isNavActive(path: string, item: AppNavItem): boolean {
  if (item.exact) return path === item.to;
  return path === item.to || path.startsWith(item.to + "/");
}
