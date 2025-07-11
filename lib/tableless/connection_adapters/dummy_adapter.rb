# frozen_string_literal: true
require 'ostruct'

module Tableless
  class DummyAdapter < ActiveRecord::ConnectionAdapters::AbstractAdapter
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
      @db_config ||= OpenStruct.new(adapter: :dummy)
    end

    def with_connection(*)
      yield self
    end
  end
end
