import { useCallback } from "react";
import { useDropzone } from "react-dropzone";
import { Upload, FileSpreadsheet, CheckCircle2 } from "lucide-react";
import { cn } from "@/lib/utils";

type Props = {
  label: string;
  description: string;
  file: File | null;
  onFile: (file: File | null) => void;
  accent?: "primary" | "accent";
};

export function FileDropzone({ label, description, file, onFile, accent = "primary" }: Props) {
  const onDrop = useCallback((accepted: File[]) => {
    if (accepted[0]) onFile(accepted[0]);
  }, [onFile]);

  const { getRootProps, getInputProps, isDragActive } = useDropzone({
    onDrop,
    multiple: false,
    accept: {
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet": [".xlsx"],
      "application/vnd.ms-excel": [".xls"],
      "text/csv": [".csv"],
    },
  });

  return (
    <div
      {...getRootProps()}
      className={cn(
        "group relative cursor-pointer rounded-xl border-2 border-dashed bg-surface p-6 transition-all",
        "hover:border-primary/60 hover:shadow-soft",
        isDragActive && "border-primary bg-primary/5 shadow-glow",
        file && "border-success/50 bg-success/5",
      )}
    >
      <input {...getInputProps()} />
      <div className="flex items-start gap-4">
        <div
          className={cn(
            "flex h-12 w-12 shrink-0 items-center justify-center rounded-lg",
            accent === "primary" ? "bg-primary/10 text-primary" : "bg-accent/20 text-accent-foreground",
            file && "bg-success/15 text-success",
          )}
        >
          {file ? <CheckCircle2 className="h-6 w-6" /> : <Upload className="h-6 w-6" />}
        </div>
        <div className="flex-1 min-w-0">
          <p className="text-sm font-semibold text-foreground">{label}</p>
          <p className="mt-0.5 text-xs text-muted-foreground">{description}</p>
          {file ? (
            <div className="mt-3 flex items-center gap-2 rounded-md bg-background/60 px-3 py-2 text-xs">
              <FileSpreadsheet className="h-4 w-4 text-success" />
              <span className="truncate font-medium">{file.name}</span>
              <span className="ml-auto text-muted-foreground">{(file.size / 1024).toFixed(0)} KB</span>
              <button
                type="button"
                className="text-muted-foreground hover:text-destructive"
                onClick={(e) => {
                  e.stopPropagation();
                  onFile(null);
                }}
              >
                remover
              </button>
            </div>
          ) : (
            <p className="mt-3 text-xs text-muted-foreground">
              Arraste o arquivo aqui ou <span className="font-medium text-primary">clique para selecionar</span> · XLSX, XLS ou CSV
            </p>
          )}
        </div>
      </div>
    </div>
  );
}
