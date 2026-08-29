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
      activities: {
        Row: {
          category: string | null
          cost: number
          created_at: string
          id: string
          notes: string | null
          scheduled_at: string | null
          stop_id: string
          title: string
          updated_at: string
          user_id: string
        }
        Insert: {
          category?: string | null
          cost?: number
          created_at?: string
          id?: string
          notes?: string | null
          scheduled_at?: string | null
          stop_id: string
          title: string
          updated_at?: string
          user_id: string
        }
        Update: {
          category?: string | null
          cost?: number
          created_at?: string
          id?: string
          notes?: string | null
          scheduled_at?: string | null
          stop_id?: string
          title?: string
          updated_at?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "activities_stop_id_fkey"
            columns: ["stop_id"]
            isOneToOne: false
            referencedRelation: "stops"
            referencedColumns: ["id"]
          },
        ]
      }
      destination_activities: {
        Row: {
          description: string | null
          destination_id: string
          experience_tag: string | null
          icon: string | null
          id: string
          is_indoor: boolean
          months: number[]
          season_tags: string[]
          sort: number
          title: string
          weather_conditions: string[]
        }
        Insert: {
          description?: string | null
          destination_id: string
          experience_tag?: string | null
          icon?: string | null
          id?: string
          is_indoor?: boolean
          months?: number[]
          season_tags?: string[]
          sort?: number
          title: string
          weather_conditions?: string[]
        }
        Update: {
          description?: string | null
          destination_id?: string
          experience_tag?: string | null
          icon?: string | null
          id?: string
          is_indoor?: boolean
          months?: number[]
          season_tags?: string[]
          sort?: number
          title?: string
          weather_conditions?: string[]
        }
        Relationships: [
          {
            foreignKeyName: "destination_activities_destination_id_fkey"
            columns: ["destination_id"]
            isOneToOne: false
            referencedRelation: "destinations"
            referencedColumns: ["id"]
          },
        ]
      }
      destination_images: {
        Row: {
          alt: string | null
          category: string | null
          credit: string | null
          destination_id: string
          id: string
          license: string | null
          season_tag: string | null
          sort: number
          source_url: string | null
          thumb_url: string | null
          url: string
        }
        Insert: {
          alt?: string | null
          category?: string | null
          credit?: string | null
          destination_id: string
          id?: string
          license?: string | null
          season_tag?: string | null
          sort?: number
          source_url?: string | null
          thumb_url?: string | null
          url: string
        }
        Update: {
          alt?: string | null
          category?: string | null
          credit?: string | null
          destination_id?: string
          id?: string
          license?: string | null
          season_tag?: string | null
          sort?: number
          source_url?: string | null
          thumb_url?: string | null
          url?: string
        }
        Relationships: [
          {
            foreignKeyName: "destination_images_destination_id_fkey"
            columns: ["destination_id"]
            isOneToOne: false
            referencedRelation: "destinations"
            referencedColumns: ["id"]
          },
        ]
      }
      destination_seasons: {
        Row: {
          activities: string[]
          budget: string | null
          crowd: string | null
          destination_id: string
          id: string
          label: string
          months: number[]
          notes: string | null
          rating: string | null
          sort: number
          weather: string | null
        }
        Insert: {
          activities?: string[]
          budget?: string | null
          crowd?: string | null
          destination_id: string
          id?: string
          label: string
          months: number[]
          notes?: string | null
          rating?: string | null
          sort?: number
          weather?: string | null
        }
        Update: {
          activities?: string[]
          budget?: string | null
          crowd?: string | null
          destination_id?: string
          id?: string
          label?: string
          months?: number[]
          notes?: string | null
          rating?: string | null
          sort?: number
          weather?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "destination_seasons_destination_id_fkey"
            columns: ["destination_id"]
            isOneToOne: false
            referencedRelation: "destinations"
            referencedColumns: ["id"]
          },
        ]
      }
      destinations: {
        Row: {
          altitude_m: number | null
          best_months: number[]
          budget_level: string | null
          created_at: string
          description: string | null
          experience_tags: string[]
          famous_food: string[]
          festivals: string[]
          id: string
          is_hidden_gem: boolean
          kind: string
          latitude: number
          local_experiences: string[]
          longitude: number
          name: string
          popularity: number
          recommended_days: string | null
          region_id: string
          season_tags: string[]
          slug: string
          summary: string | null
          updated_at: string
          wikipedia_title: string | null
        }
        Insert: {
          altitude_m?: number | null
          best_months?: number[]
          budget_level?: string | null
          created_at?: string
          description?: string | null
          experience_tags?: string[]
          famous_food?: string[]
          festivals?: string[]
          id?: string
          is_hidden_gem?: boolean
          kind?: string
          latitude: number
          local_experiences?: string[]
          longitude: number
          name: string
          popularity?: number
          recommended_days?: string | null
          region_id: string
          season_tags?: string[]
          slug: string
          summary?: string | null
          updated_at?: string
          wikipedia_title?: string | null
        }
        Update: {
          altitude_m?: number | null
          best_months?: number[]
          budget_level?: string | null
          created_at?: string
          description?: string | null
          experience_tags?: string[]
          famous_food?: string[]
          festivals?: string[]
          id?: string
          is_hidden_gem?: boolean
          kind?: string
          latitude?: number
          local_experiences?: string[]
          longitude?: number
          name?: string
          popularity?: number
          recommended_days?: string | null
          region_id?: string
          season_tags?: string[]
          slug?: string
          summary?: string | null
          updated_at?: string
          wikipedia_title?: string | null
        }
        Relationships: [
          {
            foreignKeyName: "destinations_region_id_fkey"
            columns: ["region_id"]
            isOneToOne: false
            referencedRelation: "regions"
            referencedColumns: ["id"]
          },
        ]
      }
      media_cache: {
        Row: {
          cache_key: string
          fetched_at: string
          id: string
          payload: Json
        }
        Insert: {
          cache_key: string
          fetched_at?: string
          id?: string
          payload: Json
        }
        Update: {
          cache_key?: string
          fetched_at?: string
          id?: string
          payload?: Json
        }
        Relationships: []
      }
      profiles: {
        Row: {
          avatar_url: string | null
          created_at: string
          display_name: string | null
          id: string
          updated_at: string
        }
        Insert: {
          avatar_url?: string | null
          created_at?: string
          display_name?: string | null
          id: string
          updated_at?: string
        }
        Update: {
          avatar_url?: string | null
          created_at?: string
          display_name?: string | null
          id?: string
          updated_at?: string
        }
        Relationships: []
      }
      regions: {
        Row: {
          best_seasons: string[]
          capital: string | null
          code: string | null
          created_at: string
          id: string
          kind: string
          latitude: number | null
          longitude: number | null
          name: string
          parent_id: string | null
          slug: string
          sort: number
          summary: string | null
          tags: string[]
          updated_at: string
        }
        Insert: {
          best_seasons?: string[]
          capital?: string | null
          code?: string | null
          created_at?: string
          id?: string
          kind: string
          latitude?: number | null
          longitude?: number | null
          name: string
          parent_id?: string | null
          slug: string
          sort?: number
          summary?: string | null
          tags?: string[]
          updated_at?: string
        }
        Update: {
          best_seasons?: string[]
          capital?: string | null
          code?: string | null
          created_at?: string
          id?: string
          kind?: string
          latitude?: number | null
          longitude?: number | null
          name?: string
          parent_id?: string | null
          slug?: string
          sort?: number
          summary?: string | null
          tags?: string[]
          updated_at?: string
        }
        Relationships: [
          {
            foreignKeyName: "regions_parent_id_fkey"
            columns: ["parent_id"]
            isOneToOne: false
            referencedRelation: "regions"
            referencedColumns: ["id"]
          },
        ]
      }
      stops: {
        Row: {
          arrival_date: string | null
          city: string
          country: string | null
          created_at: string
          departure_date: string | null
          id: string
          notes: string | null
          position: number
          trip_id: string
          updated_at: string
          user_id: string
        }
        Insert: {
          arrival_date?: string | null
          city: string
          country?: string | null
          created_at?: string
          departure_date?: string | null
          id?: string
          notes?: string | null
          position?: number
          trip_id: string
          updated_at?: string
          user_id: string
        }
        Update: {
          arrival_date?: string | null
          city?: string
          country?: string | null
          created_at?: string
          departure_date?: string | null
          id?: string
          notes?: string | null
          position?: number
          trip_id?: string
          updated_at?: string
          user_id?: string
        }
        Relationships: [
          {
            foreignKeyName: "stops_trip_id_fkey"
            columns: ["trip_id"]
            isOneToOne: false
            referencedRelation: "trips"
            referencedColumns: ["id"]
          },
        ]
      }
      trips: {
        Row: {
          budget: number
          cover_image_url: string | null
          created_at: string
          description: string | null
          destination: string | null
          end_date: string | null
          id: string
          name: string
          start_date: string | null
          updated_at: string
          user_id: string
        }
        Insert: {
          budget?: number
          cover_image_url?: string | null
          created_at?: string
          description?: string | null
          destination?: string | null
          end_date?: string | null
          id?: string
          name: string
          start_date?: string | null
          updated_at?: string
          user_id: string
        }
        Update: {
          budget?: number
          cover_image_url?: string | null
          created_at?: string
          description?: string | null
          destination?: string | null
          end_date?: string | null
          id?: string
          name?: string
          start_date?: string | null
          updated_at?: string
          user_id?: string
        }
        Relationships: []
      }
      weather_cache: {
        Row: {
          cache_key: string
          fetched_at: string
          id: string
          payload: Json
        }
        Insert: {
          cache_key: string
          fetched_at?: string
          id?: string
          payload: Json
        }
        Update: {
          cache_key?: string
          fetched_at?: string
          id?: string
          payload?: Json
        }
        Relationships: []
      }
    }
    Views: {
      [_ in never]: never
    }
    Functions: {
      [_ in never]: never
    }
    Enums: {
      [_ in never]: never
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
    Enums: {},
  },
} as const
