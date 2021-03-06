require 'tableless/connection_adapters/schema_cache'
require 'tableless/connection_adapters/dummy_adapter'

module Tableless
  module Connection
    extend ActiveSupport::Concern

    module ClassMethods
      def connection
        @connection ||= Tableless::DummyAdapter.new(nil)
      end

      def attribute_names
        @attribute_names ||= attribute_types.keys
      end
    end
  end
end
