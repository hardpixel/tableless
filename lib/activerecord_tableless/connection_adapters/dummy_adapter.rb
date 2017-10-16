module ActiverecordTableless
  class DummyAdapter < ActiveRecord::ConnectionAdapters::AbstractAdapter
    def initialize(*)
      super
      @schema_cache = ActiverecordTableless::SchemaCache.new
    end
  end
end
