require_relative 'schema_cache'

module ActiverecordTableless
  class ConnectionAdapter < ActiveRecord::ConnectionAdapters::AbstractAdapter
    def initialize(*)
      super
      @schema_cache = ActiverecordTableless::SchemaCache.new
    end
  end
end
