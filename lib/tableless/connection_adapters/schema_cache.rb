module Tableless
  class SchemaCache
    def columns_hash(table_name)
      {}
    end

    def data_source_exists?(table_name)
      false
    end

    def clear_data_source_cache!(table_name)
      true
    end
  end
end
