# frozen_string_literal: true

module Tableless
  class NullPool < ActiveRecord::ConnectionAdapters::NullPool
    def with_pool_transaction_isolation_level(*)
      yield self
    end
  end
end
