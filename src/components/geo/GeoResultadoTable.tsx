import { memo } from "react";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { Badge } from "@/components/ui/badge";
import { Checkbox } from "@/components/ui/checkbox";
import { Button } from "@/components/ui/button";
import type { ResultRow } from "@/lib/geo/store";
import { Pencil, Save, X } from "lucide-react";

type Bairro = { id: string; bairro_oficial: string; regiao_urbana: string | null };

export function rowKey(r: ResultRow) {
  return r.id ?? String(r.linha);
}

type GeoResultadoTableProps = {
  rows: ResultRow[];
  totalFiltered: number;
  visibleCount: number;
  onLoadMore: () => void;
  selected: Set<string>;
  editId: string | null;
  editBairroId: string;
  bairros: Bairro[];
  informadoCountMap: Map<string, number>;
  allFilteredSelected: boolean;
  someFilteredSelected: boolean;
  onToggleSelect: (key: string, checked: boolean) => void;
  onToggleSelectAll: (checked: boolean) => void;
  onEditBairroIdChange: (id: string) => void;
  onSelectSameInformado: (bairro: string) => void;
  onStartEdit: (row: ResultRow) => void;
  onSaveCorrection: (row: ResultRow) => void;
  onCancelEdit: () => void;
};

export const GeoResultadoTable = memo(function GeoResultadoTable({
  rows,
  totalFiltered,
  visibleCount,
  onLoadMore,
  selected,
  editId,
  editBairroId,
  bairros,
  informadoCountMap,
  allFilteredSelected,
  someFilteredSelected,
  onToggleSelect,
  onToggleSelectAll,
  onEditBairroIdChange,
  onSelectSameInformado,
  onStartEdit,
  onSaveCorrection,
  onCancelEdit,
}: GeoResultadoTableProps) {
  const canEdit = (r: ResultRow) => r.status_match === "nao_encontrado" || r.status_match === "similaridade";
  const hasMore = visibleCount < totalFiltered;

  return (
    <div className="space-y-3">
      <div className="overflow-x-auto">
        <Table>
          <TableHeader>
            <TableRow>
              <TableHead className="w-10">
                <Checkbox
                  checked={allFilteredSelected ? true : someFilteredSelected ? "indeterminate" : false}
                  onCheckedChange={(v) => onToggleSelectAll(v === true)}
                  aria-label="Selecionar todas filtradas e editar"
                />
              </TableHead>
              <TableHead>Linha</TableHead>
              <TableHead>Bairro Informado</TableHead>
              <TableHead>Bairro Oficial</TableHead>
              <TableHead>Parcelamento</TableHead>
              <TableHead>Região Urbana</TableHead>
              <TableHead>Confiança</TableHead>
              <TableHead>Status</TableHead>
              <TableHead className="w-36 text-right">Ações</TableHead>
            </TableRow>
          </TableHeader>
          <TableBody>
            {rows.map((r) => (
              <ResultadoTableRow
                key={rowKey(r)}
                row={r}
                isSelected={selected.has(rowKey(r))}
                editing={editId === rowKey(r)}
                editBairroId={editBairroId}
                bairros={bairros}
                sameInformadoCount={informadoCountMap.get(r.bairro_original) ?? 1}
                onToggleSelect={onToggleSelect}
                onEditBairroIdChange={onEditBairroIdChange}
                onSelectSameInformado={onSelectSameInformado}
                onStartEdit={onStartEdit}
                onSaveCorrection={onSaveCorrection}
                onCancelEdit={onCancelEdit}
                canEdit={canEdit(r)}
              />
            ))}
          </TableBody>
        </Table>
      </div>
      {hasMore && (
        <div className="flex justify-center">
          <Button variant="outline" size="sm" onClick={onLoadMore}>
            Carregar mais ({Math.min(visibleCount, totalFiltered)} de {totalFiltered})
          </Button>
        </div>
      )}
    </div>
  );
});

type RowProps = {
  row: ResultRow;
  isSelected: boolean;
  editing: boolean;
  editBairroId: string;
  bairros: Bairro[];
  sameInformadoCount: number;
  canEdit: boolean;
  onToggleSelect: (key: string, checked: boolean) => void;
  onEditBairroIdChange: (id: string) => void;
  onSelectSameInformado: (bairro: string) => void;
  onStartEdit: (row: ResultRow) => void;
  onSaveCorrection: (row: ResultRow) => void;
  onCancelEdit: () => void;
};

const ResultadoTableRow = memo(function ResultadoTableRow({
  row: r,
  isSelected,
  editing,
  editBairroId,
  bairros,
  sameInformadoCount,
  canEdit,
  onToggleSelect,
  onEditBairroIdChange,
  onSelectSameInformado,
  onStartEdit,
  onSaveCorrection,
  onCancelEdit,
}: RowProps) {
  const key = rowKey(r);

  return (
    <TableRow className={isSelected ? "bg-primary/5" : undefined}>
      <TableCell>
        <Checkbox
          checked={isSelected}
          onCheckedChange={(v) => onToggleSelect(key, v === true)}
          aria-label={`Selecionar linha ${r.linha}`}
        />
      </TableCell>
      <TableCell>{r.linha}</TableCell>
      <TableCell>
        <div className="flex flex-col gap-0.5">
          <span>{r.bairro_original}</span>
          {sameInformadoCount > 1 && (
            <button
              type="button"
              className="text-left text-[10px] text-primary hover:underline"
              onClick={() => onSelectSameInformado(r.bairro_original)}
            >
              Editar {sameInformadoCount} iguais
            </button>
          )}
        </div>
      </TableCell>
      <TableCell>
        {editing ? (
          <select
            className="h-8 rounded-md border border-input bg-background px-2 text-sm"
            value={editBairroId}
            onChange={(e) => onEditBairroIdChange(e.target.value)}
          >
            <option value="">— selecione —</option>
            {bairros.map((b) => (
              <option key={b.id} value={b.id}>
                {b.bairro_oficial}
              </option>
            ))}
          </select>
        ) : (
          (r.bairro_oficial ?? "—")
        )}
      </TableCell>
      <TableCell className="max-w-[220px] truncate" title={r.parcelamento ?? ""}>
        {r.parcelamento ?? "—"}
      </TableCell>
      <TableCell>{r.regiao_urbana ?? "—"}</TableCell>
      <TableCell>{r.percentual_confianca}%</TableCell>
      <TableCell>
        {r.status_match === "encontrado" && <Badge className="bg-emerald-600">Encontrado</Badge>}
        {r.status_match === "similaridade" && (
          <Badge className="bg-amber-500">Encontrado por Similaridade</Badge>
        )}
        {r.status_match === "nao_encontrado" && <Badge variant="destructive">Não Encontrado</Badge>}
      </TableCell>
      <TableCell className="space-x-1 text-right">
        {editing ? (
          <>
            <Button size="sm" onClick={() => onSaveCorrection(r)} disabled={!editBairroId}>
              <Save className="h-3 w-3" />
            </Button>
            <Button size="sm" variant="ghost" onClick={onCancelEdit}>
              <X className="h-3 w-3" />
            </Button>
          </>
        ) : canEdit ? (
          <Button size="sm" variant="ghost" onClick={() => onStartEdit(r)}>
            <Pencil className="h-3 w-3" />
          </Button>
        ) : null}
      </TableCell>
    </TableRow>
  );
});

/** Índice pré-computado para filtragem rápida em listas grandes. */
export function buildResultIndex(results: ResultRow[]) {
  return results.map((row) => ({
    row,
    informadoLower: row.bairro_original.toLowerCase(),
    oficialLower: (row.bairro_oficial ?? "").toLowerCase(),
  }));
}

export function filterResultIndex(
  index: ReturnType<typeof buildResultIndex>,
  filters: {
    status: string;
    informado: string;
    oficial: string;
    regiao: string;
  },
) {
  const qInformado = filters.informado.trim().toLowerCase();
  const qOficial = filters.oficial.trim().toLowerCase();

  return index
    .filter(({ row, informadoLower, oficialLower }) => {
      if (filters.status && row.status_match !== filters.status) return false;
      if (qInformado && !informadoLower.includes(qInformado) && !oficialLower.includes(qInformado)) return false;
      if (qOficial && !oficialLower.includes(qOficial)) return false;
      if (filters.regiao && row.regiao_urbana !== filters.regiao) return false;
      return true;
    })
    .map((x) => x.row);
}

export function buildInformadoCountMap(results: ResultRow[]) {
  const m = new Map<string, number>();
  for (const r of results) {
    m.set(r.bairro_original, (m.get(r.bairro_original) ?? 0) + 1);
  }
  return m;
}

export const TABLE_PAGE_SIZE = 150;
