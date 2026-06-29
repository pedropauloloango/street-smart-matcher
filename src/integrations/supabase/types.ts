export type Json =
  | string
  | number
  | boolean
  | null
  | { [key: string]: Json | undefined }
  | Json[]

export type Database = {
  // Allows to automatically instantiate createClient with right options
  // instead of createClient<Database, { PostgrestVersion: 'XX' }>(URL, KEY)
  __InternalSupabase: {
    PostgrestVersion: "14.5"
  }
  public: {
    Tables: {
      bairros_dicionario: {
        Row: {
          acertos: number
          bairro_normalizado: string
          bairro_oficial: string
          created_at: string
          id: string
          origem: string
          parcelamento: string | null
          regiao_urbana: string | null
          updated_at: string
        }
        Insert: {
          acertos?: number
          bairro_normalizado: string
          bairro_oficial: string
          created_at?: string
          id?: string
          origem?: string
          parcelamento?: string | null
          regiao_urbana?: string | null
          updated_at?: string
        }
        Update: {
          acertos?: number
          bairro_normalizado?: string
          bairro_oficial?: string
          created_at?: string
          id?: string
          origem?: string
          parcelamento?: string | null
          regiao_urbana?: string | null
          updated_at?: string
        }
        Relationships: []
      }
      geo_bairros: {
        Row: {
          ativo: boolean
          bairro_oficial: string
          data_cadastro: string
          id: string
          regiao_urbana: string | null
        }
        Insert: {
          ativo?: boolean
          bairro_oficial: string
          data_cadastro?: string
          id?: string
          regiao_urbana?: string | null
        }
        Update: {
          ativo?: boolean
          bairro_oficial?: string
          data_cadastro?: string
          id?: string
          regiao_urbana?: string | null
        }
        Relationships: []
      }
      geo_bairro_ceps: {
        Row: {
          ativo: boolean
          bairro_id: string
          cep_fim: string | null
          cep_inicio: string
          data_cadastro: string
          id: string
          logradouro: string | null
        }
        Insert: {
          ativo?: boolean
          bairro_id: string
          cep_fim?: string | null
          cep_inicio: string
          data_cadastro?: string
          id?: string
          logradouro?: string | null
        }
        Update: {
          ativo?: boolean
          bairro_id?: string
          cep_fim?: string | null
          cep_inicio?: string
          data_cadastro?: string
          id?: string
          logradouro?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "geo_bairro_ceps_bairro_id_fkey"
            columns: ["bairro_id"]
            isOneToOne: false
            referencedRelation: "geo_bairros"
            referencedColumns: ["id"]
          },
        ]
      }
      geo_importacoes: {
        Row: {
          data_importacao: string
          encontrados: number
          id: string
          nao_encontrados: number
          nome_arquivo: string
          similares: number
          status: string
          total_registros: number
          usuario: string | null
        }
        Insert: {
          data_importacao?: string
          encontrados?: number
          id?: string
          nao_encontrados?: number
          nome_arquivo: string
          similares?: number
          status?: string
          total_registros?: number
          usuario?: string | null
        }
        Update: {
          data_importacao?: string
          encontrados?: number
          id?: string
          nao_encontrados?: number
          nome_arquivo?: string
          similares?: number
          status?: string
          total_registros?: number
          usuario?: string | null
        }
        Relationships: []
      }
      geo_parcelamentos: {
        Row: {
          ativo: boolean
          bairro_id: string
          data_cadastro: string
          id: string
          parcelamento: string
        }
        Insert: {
          ativo?: boolean
          bairro_id: string
          data_cadastro?: string
          id?: string
          parcelamento: string
        }
        Update: {
          ativo?: boolean
          bairro_id?: string
          data_cadastro?: string
          id?: string
          parcelamento?: string
        }
        Relationships: [
          {
            foreignKeyName: "geo_parcelamentos_bairro_id_fkey"
            columns: ["bairro_id"]
            isOneToOne: false
            referencedRelation: "geo_bairros"
            referencedColumns: ["id"]
          },
        ]
      }
      geo_resultados: {
        Row: {
          bairro_oficial: string | null
          bairro_original: string | null
          cep: string | null
          created_at: string
          id: string
          importacao_id: string
          linha_original: number
          logradouro: string | null
          parcelamento: string | null
          percentual_confianca: number
          regiao_urbana: string | null
          status_match: string
        }
        Insert: {
          bairro_oficial?: string | null
          bairro_original?: string | null
          cep?: string | null
          created_at?: string
          id?: string
          importacao_id: string
          linha_original: number
          logradouro?: string | null
          parcelamento?: string | null
          percentual_confianca?: number
          regiao_urbana?: string | null
          status_match?: string
        }
        Update: {
          bairro_oficial?: string | null
          bairro_original?: string | null
          cep?: string | null
          created_at?: string
          id?: string
          importacao_id?: string
          linha_original?: number
          logradouro?: string | null
          parcelamento?: string | null
          percentual_confianca?: number
          regiao_urbana?: string | null
          status_match?: string
        }
        Relationships: [
          {
            foreignKeyName: "geo_resultados_importacao_id_fkey"
            columns: ["importacao_id"]
            isOneToOne: false
            referencedRelation: "geo_importacoes"
            referencedColumns: ["id"]
          },
        ]
      }
      geo_sinonimos: {
        Row: {
          bairro_id: string
          confianca: number
          data_cadastro: string
          id: string
          nome_informado: string
          nome_normalizado: string
          tipo_correspondencia: string
        }
        Insert: {
          bairro_id: string
          confianca?: number
          data_cadastro?: string
          id?: string
          nome_informado: string
          nome_normalizado: string
          tipo_correspondencia?: string
        }
        Update: {
          bairro_id?: string
          confianca?: number
          data_cadastro?: string
          id?: string
          nome_informado?: string
          nome_normalizado?: string
          tipo_correspondencia?: string
        }
        Relationships: [
          {
            foreignKeyName: "geo_sinonimos_bairro_id_fkey"
            columns: ["bairro_id"]
            isOneToOne: false
            referencedRelation: "geo_bairros"
            referencedColumns: ["id"]
          },
        ]
      }
      processamentos: {
        Row: {
          created_at: string
          id: string
          matched: number
          nome_arquivo: string
          percentual: number
          total_registros: number
          unmatched: number
        }
        Insert: {
          created_at?: string
          id?: string
          matched?: number
          nome_arquivo: string
          percentual?: number
          total_registros?: number
          unmatched?: number
        }
        Update: {
          created_at?: string
          id?: string
          matched?: number
          nome_arquivo?: string
          percentual?: number
          total_registros?: number
          unmatched?: number
        }
        Relationships: []
      }
      profiles: {
        Row: {
          created_at: string
          email: string | null
          id: string
          nome_completo: string | null
          updated_at: string
        }
        Insert: {
          created_at?: string
          email?: string | null
          id: string
          nome_completo?: string | null
          updated_at?: string
        }
        Update: {
          created_at?: string
          email?: string | null
          id?: string
          nome_completo?: string | null
          updated_at?: string
        }
        Relationships: []
      }
      user_roles: {
        Row: {
          created_at: string
          id: string
          role: Database["public"]["Enums"]["app_role"]
          user_id: string
        }
        Insert: {
          created_at?: string
          id?: string
          role: Database["public"]["Enums"]["app_role"]
          user_id: string
        }
        Update: {
          created_at?: string
          id?: string
          role?: Database["public"]["Enums"]["app_role"]
          user_id?: string
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      has_role: {
        Args: {
          _role: Database["public"]["Enums"]["app_role"]
          _user_id: string
        }
        Returns: boolean
      }
      is_admin_or_super: { Args: { _user_id: string }; Returns: boolean }
    }
    Enums: {
      app_role: "super_admin" | "admin" | "user"
    }
    CompositeTypes: {
      [_ in never]: never
    }
  }
}

type DatabaseWithoutInternals = Omit<Database, "__InternalSupabase">

type DefaultSchema = DatabaseWithoutInternals[Extract<keyof Database, "public">]

export type Tables<
  DefaultSchemaTableNameOrOptions extends
    | keyof (DefaultSchema["Tables"] & DefaultSchema["Views"])
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
        DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? (DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"] &
      DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Views"])[TableName] extends {
      Row: infer R
    }
    ? R
    : never
  : DefaultSchemaTableNameOrOptions extends keyof (DefaultSchema["Tables"] &
        DefaultSchema["Views"])
    ? (DefaultSchema["Tables"] &
        DefaultSchema["Views"])[DefaultSchemaTableNameOrOptions] extends {
        Row: infer R
      }
      ? R
      : never
    : never

export type TablesInsert<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Insert: infer I
    }
    ? I
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Insert: infer I
      }
      ? I
      : never
    : never

export type TablesUpdate<
  DefaultSchemaTableNameOrOptions extends
    | keyof DefaultSchema["Tables"]
    | { schema: keyof DatabaseWithoutInternals },
  TableName extends DefaultSchemaTableNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"]
    : never = never,
> = DefaultSchemaTableNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaTableNameOrOptions["schema"]]["Tables"][TableName] extends {
      Update: infer U
    }
    ? U
    : never
  : DefaultSchemaTableNameOrOptions extends keyof DefaultSchema["Tables"]
    ? DefaultSchema["Tables"][DefaultSchemaTableNameOrOptions] extends {
        Update: infer U
      }
      ? U
      : never
    : never

export type Enums<
  DefaultSchemaEnumNameOrOptions extends
    | keyof DefaultSchema["Enums"]
    | { schema: keyof DatabaseWithoutInternals },
  EnumName extends DefaultSchemaEnumNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"]
    : never = never,
> = DefaultSchemaEnumNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[DefaultSchemaEnumNameOrOptions["schema"]]["Enums"][EnumName]
  : DefaultSchemaEnumNameOrOptions extends keyof DefaultSchema["Enums"]
    ? DefaultSchema["Enums"][DefaultSchemaEnumNameOrOptions]
    : never

export type CompositeTypes<
  PublicCompositeTypeNameOrOptions extends
    | keyof DefaultSchema["CompositeTypes"]
    | { schema: keyof DatabaseWithoutInternals },
  CompositeTypeName extends PublicCompositeTypeNameOrOptions extends {
    schema: keyof DatabaseWithoutInternals
  }
    ? keyof DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"]
    : never = never,
> = PublicCompositeTypeNameOrOptions extends {
  schema: keyof DatabaseWithoutInternals
}
  ? DatabaseWithoutInternals[PublicCompositeTypeNameOrOptions["schema"]]["CompositeTypes"][CompositeTypeName]
  : PublicCompositeTypeNameOrOptions extends keyof DefaultSchema["CompositeTypes"]
    ? DefaultSchema["CompositeTypes"][PublicCompositeTypeNameOrOptions]
    : never

export const Constants = {
  public: {
    Enums: {
      app_role: ["super_admin", "admin", "user"],
    },
  },
} as const
