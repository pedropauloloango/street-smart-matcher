import { createFileRoute, Link } from "@tanstack/react-router";
import {
  ArrowRight,
  BookOpen,
  Database,
  History,
  MapPin,
  Sparkles,
  Table2,
  Upload,
  Wand2,
} from "lucide-react";
import { Button } from "@/components/ui/button";

export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "BairroMatch · Conciliação de bairros Campo Grande-MS" },
      {
        name: "description",
        content:
          "Plataforma para conciliar bairros da Receita Federal com SISGRAN e normalizar endereços com a base oficial de Campo Grande-MS.",
      },
    ],
  }),
  component: LandingPage,
});

const features = [
  {
    icon: Sparkles,
    title: "BairroMatch",
    subtitle: "Receita Federal ↔ SISGRAN",
    description:
      "Envie planilhas da Receita e referência SISGRAN. O sistema normaliza nomes, expande abreviações e aplica fuzzy matching para retornar bairro oficial, parcelamento e região urbana.",
    items: ["Processamento em lote", "Dicionário aprendido", "Correções manuais", "Histórico de importações"],
  },
  {
    icon: MapPin,
    title: "GeoBairros CG",
    subtitle: "Base oficial Campo Grande-MS",
    description:
      "Módulo de normalização geográfica com 67 bairros oficiais, sinônimos, parcelamentos e matching refinado. Importe planilhas, revise resultados e exporte dados padronizados.",
    items: ["Base oficial editável", "Sinônimos e parcelamentos", "Edição em lote", "Exportação XLSX"],
  },
];

const steps = [
  { n: "1", title: "Entre na plataforma", text: "Faça login com sua conta para acessar as ferramentas de conciliação." },
  { n: "2", title: "Importe suas planilhas", text: "Carregue arquivos da Receita, SISGRAN ou bases próprias no formato esperado." },
  { n: "3", title: "Revise e corrija", text: "Analise correspondências, ajuste manualmente os casos sem match e salve no dicionário." },
  { n: "4", title: "Exporte o resultado", text: "Baixe planilhas padronizadas prontas para uso em sistemas e relatórios." },
];

function LandingPage() {
  return (
    <div className="flex flex-col">
      {/* Hero */}
      <section className="relative overflow-hidden bg-gradient-brand px-4 py-20 text-white sm:px-6 sm:py-28">
        <div className="absolute -right-24 -top-24 h-96 w-96 rounded-full bg-white/10 blur-3xl" />
        <div className="absolute -bottom-16 -left-16 h-64 w-64 rounded-full bg-white/5 blur-3xl" />
        <div className="relative mx-auto max-w-4xl text-center">
          <div className="mb-6 inline-flex items-center gap-2 rounded-full bg-white/15 px-4 py-1.5 text-xs font-medium backdrop-blur">
            <Sparkles className="h-3.5 w-3.5" />
            Campo Grande-MS · Padronização inteligente de bairros
          </div>
          <h1 className="text-4xl font-bold tracking-tight sm:text-5xl lg:text-6xl">
            Concilie e normalize bairros com precisão
          </h1>
          <p className="mx-auto mt-5 max-w-2xl text-base text-white/85 sm:text-lg">
            Uma plataforma unificada para cruzar dados da Receita Federal com SISGRAN e normalizar endereços
            usando a base oficial de bairros de Campo Grande. Menos retrabalho, mais consistência nos seus dados.
          </p>
          <div className="mt-8 flex flex-wrap items-center justify-center gap-3">
            <Button asChild size="lg" variant="secondary" className="gap-2 font-semibold">
              <Link to="/auth">
                Entrar na plataforma
                <ArrowRight className="h-4 w-4" />
              </Link>
            </Button>
          </div>
        </div>
      </section>

      {/* Módulos */}
      <section className="mx-auto max-w-6xl px-4 py-16 sm:px-6 sm:py-20">
        <div className="mb-12 text-center">
          <h2 className="text-2xl font-bold sm:text-3xl">Dois módulos, uma plataforma</h2>
          <p className="mt-2 text-muted-foreground">
            Ferramentas complementares para diferentes fluxos de conciliação e normalização.
          </p>
        </div>
        <div className="grid gap-6 md:grid-cols-2">
          {features.map((f) => (
            <div
              key={f.title}
              className="rounded-2xl border border-border/60 bg-card p-6 shadow-soft transition-shadow hover:shadow-md"
            >
              <div className="mb-4 flex items-center gap-3">
                <div className="flex h-11 w-11 items-center justify-center rounded-xl bg-gradient-brand text-white shadow-glow">
                  <f.icon className="h-5 w-5" />
                </div>
                <div>
                  <h3 className="text-lg font-semibold">{f.title}</h3>
                  <p className="text-xs text-muted-foreground">{f.subtitle}</p>
                </div>
              </div>
              <p className="text-sm text-muted-foreground">{f.description}</p>
              <ul className="mt-4 grid grid-cols-2 gap-2">
                {f.items.map((item) => (
                  <li key={item} className="flex items-center gap-1.5 text-xs font-medium text-foreground/80">
                    <span className="h-1 w-1 rounded-full bg-primary" />
                    {item}
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>
      </section>

      {/* Funcionalidades */}
      <section className="border-y border-border/60 bg-secondary/30 px-4 py-16 sm:px-6 sm:py-20">
        <div className="mx-auto max-w-6xl">
          <h2 className="mb-10 text-center text-2xl font-bold sm:text-3xl">O que você pode fazer</h2>
          <div className="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
            <FeatureCard icon={Upload} title="Processar planilhas" text="Upload de arquivos XLSX com validação de colunas e modelos para download." />
            <FeatureCard icon={History} title="Histórico" text="Acompanhe todos os processamentos anteriores com estatísticas de correspondência." />
            <FeatureCard icon={BookOpen} title="Dicionário aprendido" text="Correções manuais viram referência permanente para futuros processamentos." />
            <FeatureCard icon={Database} title="Base oficial" text="67 bairros oficiais de Campo Grande com parcelamentos e sinônimos editáveis." />
            <FeatureCard icon={Wand2} title="Normalização" text="Pipeline de limpeza textual, expansão de abreviações e matching em cascata." />
            <FeatureCard icon={Table2} title="Resultado e exportação" text="Revise matches, edite em lote e exporte planilhas padronizadas." />
          </div>
        </div>
      </section>

      {/* Como funciona */}
      <section className="mx-auto max-w-4xl px-4 py-16 sm:px-6 sm:py-20">
        <h2 className="mb-10 text-center text-2xl font-bold sm:text-3xl">Como funciona</h2>
        <div className="space-y-6">
          {steps.map((s) => (
            <div key={s.n} className="flex gap-4">
              <div className="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-gradient-brand text-sm font-bold text-white">
                {s.n}
              </div>
              <div>
                <h3 className="font-semibold">{s.title}</h3>
                <p className="mt-0.5 text-sm text-muted-foreground">{s.text}</p>
              </div>
            </div>
          ))}
        </div>
      </section>

      {/* CTA */}
      <section className="bg-gradient-brand px-4 py-14 text-center text-white sm:px-6">
        <h2 className="text-2xl font-bold">Pronto para padronizar seus dados?</h2>
        <p className="mx-auto mt-2 max-w-lg text-sm text-white/85">
          Acesse a plataforma e comece a conciliar bairros em minutos.
        </p>
        <Button asChild size="lg" variant="secondary" className="mt-6 gap-2 font-semibold">
          <Link to="/auth">
            Entrar
            <ArrowRight className="h-4 w-4" />
          </Link>
        </Button>
      </section>
    </div>
  );
}

function FeatureCard({
  icon: Icon,
  title,
  text,
}: {
  icon: React.ComponentType<{ className?: string }>;
  title: string;
  text: string;
}) {
  return (
    <div className="rounded-xl border border-border/60 bg-card p-5 shadow-soft">
      <Icon className="mb-3 h-5 w-5 text-primary" />
      <h3 className="text-sm font-semibold">{title}</h3>
      <p className="mt-1 text-xs text-muted-foreground">{text}</p>
    </div>
  );
}
