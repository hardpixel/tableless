module Tableless
  module Querying
    extend ActiveSupport::Concern

    module ClassMethods
      def find_by_sql(*)
        []
      end

      def _query_by_sql(*)
        []
      end
    end
  end
end
