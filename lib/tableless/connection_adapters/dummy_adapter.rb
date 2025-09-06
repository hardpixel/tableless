# frozen_string_literal: true

module Tableless
  class DummyAdapter < ActiveRecord::ConnectionAdapters::AbstractAdapter
    DbConfig = Struct.new(:adapter)

    def initialize(*)
      super
      @schema_cache = Tableless::SchemaCache.new
    end

    def schema_cache
      @schema_cache
    end

    def get_schema_cache(*)
      @schema_cache
    end

    def db_config(*)
      @db_config ||= DbConfig.new(:dummy)
    end

    def with_connection(*)
      yield self
    end
  end
end
