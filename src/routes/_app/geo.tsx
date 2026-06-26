import { createFileRoute, Outlet } from "@tanstack/react-router";

export const Route = createFileRoute("/_app/geo")({
  component: GeoLayout,
});

function GeoLayout() {
  return <Outlet />;
}
