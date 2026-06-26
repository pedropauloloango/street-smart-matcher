import { useEffect, useState } from "react";
import { fetchImportacoes, type Importacao } from "@/lib/geo/api";
import { geoStore, useGeoStore } from "@/lib/geo/store";

type Props = {
  onSelect?: (imp: Importacao | null) => void;
  className?: string;
};

export function GeoImportSelector({ onSelect, className }: Props) {
  const importacaoId = useGeoStore((s) => s.importacaoId);
  const [list, setList] = useState<Importacao[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    (async () => {
      setLoading(true);
      try {
        const items = await fetchImportacoes();
        setList(items);
        if (!importacaoId && items[0]) {
          geoStore.set({ importacaoId: items[0].id, fileName: items[0].nome_arquivo });
          onSelect?.(items[0]);
        }
      } finally {
        setLoading(false);
      }
    })();
  }, []);

  const handleChange = (id: string) => {
    const imp = list.find((x) => x.id === id) ?? null;
    geoStore.set({ importacaoId: id || null, fileName: imp?.nome_arquivo ?? null });
    onSelect?.(imp);
  };

  if (loading) return <p className="text-xs text-muted-foreground">Carregando importações...</p>;
  if (!list.length) return <p className="text-xs text-muted-foreground">Nenhuma importação registrada.</p>;

  return (
    <div className={className}>
      <label className="mb-1 block text-sm font-medium">Importação</label>
      <select
        className="h-9 w-full max-w-md rounded-md border border-input bg-background px-3 text-sm"
        value={importacaoId ?? ""}
        onChange={(e) => handleChange(e.target.value)}
      >
        {list.map((imp) => (
          <option key={imp.id} value={imp.id}>
            {imp.nome_arquivo} — {new Date(imp.data_importacao).toLocaleString("pt-BR")} ({imp.total_registros} reg.)
          </option>
        ))}
      </select>
    </div>
  );
}
