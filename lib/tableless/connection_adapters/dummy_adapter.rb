# frozen_string_literal: true

require 'tableless/connection_adapters/schema_cache'
require 'tableless/connection_adapters/null_pool'

module Tableless
  class DummyAdapter < ActiveRecord::ConnectionAdapters::AbstractAdapter
    DbConfig = Struct.new(:adapter)

    def initialize(*)
      super
      @schema_cache = Tableless::SchemaCache.new
      @pool = Tableless::NullPool.new
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
