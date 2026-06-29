import { Loader2, Search, Sparkles } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import type { BairroSuggestion } from "@/lib/geo/suggest-local";

const SOURCE_LABEL: Record<BairroSuggestion["source"], string> = {
  local: "local",
  cep: "CEP",
  viacep: "Correios",
  parcelamento: "parc.",
  nominatim: "mapa",
  wikipedia: "wiki",
  web: "web",
};

type Props = {
  informado: string;
  suggestions?: BairroSuggestion[];
  loading?: boolean;
  compact?: boolean;
  onFetch?: () => void;
  onApply: (bairroId: string) => void;
};

export function GeoSuggestionChips({
  informado,
  suggestions,
  loading,
  compact,
  onFetch,
  onApply,
}: Props) {
  if (loading) {
    return (
      <div className="mt-1 flex items-center gap-1.5 text-[10px] text-muted-foreground">
        <Loader2 className="h-3 w-3 animate-spin" />
        Buscando sugestões…
      </div>
    );
  }

  if (!suggestions?.length) {
    return (
      <div className="mt-1">
        <Button
          type="button"
          variant="ghost"
          size="sm"
          className="h-6 gap-1 px-1.5 text-[10px] text-primary"
          onClick={onFetch}
        >
          <Search className="h-3 w-3" />
          Buscar na web
        </Button>
      </div>
    );
  }

  return (
    <div className={`mt-1 space-y-1 ${compact ? "" : "max-w-xs"}`}>
      <p className="flex items-center gap-1 text-[10px] font-medium text-muted-foreground">
        <Sparkles className="h-3 w-3" />
        Sugestões
      </p>
      <div className="flex flex-wrap gap-1">
        {suggestions.map((s) => (
          <button
            key={s.bairro_id}
            type="button"
            title={[s.parcelamento && `parc. ${s.parcelamento}`, s.hint, `${s.score}% · ${s.source}`]
              .filter(Boolean)
              .join(" · ")}
            className="inline-flex max-w-full items-center gap-1 rounded-md border border-primary/25 bg-primary/5 px-1.5 py-0.5 text-left text-[10px] font-medium text-primary hover:bg-primary/10"
            onClick={() => onApply(s.bairro_id)}
          >
            <span className="truncate">{s.bairro_oficial}</span>
            <Badge variant="secondary" className="h-4 shrink-0 px-1 text-[9px]">
              {s.score}%
            </Badge>
            <span className="shrink-0 text-[9px] text-muted-foreground">{SOURCE_LABEL[s.source]}</span>
          </button>
        ))}
      </div>
      {onFetch && (
        <Button type="button" variant="link" className="h-auto p-0 text-[10px]" onClick={onFetch}>
          Atualizar busca
        </Button>
      )}
    </div>
  );
}
