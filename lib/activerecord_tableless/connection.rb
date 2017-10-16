require 'activerecord_tableless/connection_adapters/schema_cache'
require 'activerecord_tableless/connection_adapters/dummy_adapter'

module ActiverecordTableless
  module Connection
    extend ActiveSupport::Concern

    module ClassMethods
      def connection
        @connection ||= ActiverecordTableless::DummyAdapter.new nil
      end
    end
  end
end
