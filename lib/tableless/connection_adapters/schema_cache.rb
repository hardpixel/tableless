# frozen_string_literal: true

module Tableless
  class SchemaCache
    def columns_hash(_table_name)
      {}
    end

    def columns_hash?(_table_name)
      true
    end

    def data_source_exists?(_table_name)
      false
    end

    def clear_data_source_cache!(_table_name)
      true
    end
  end
end
