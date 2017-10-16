module Tableless
  class DummyAdapter < ActiveRecord::ConnectionAdapters::AbstractAdapter
    def initialize(*)
      super
      @schema_cache = Tableless::SchemaCache.new
    end
  end
end
