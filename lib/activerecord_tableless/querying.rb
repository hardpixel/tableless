module ActiverecordTableless
  module Querying
    extend ActiveSupport::Concern

    module ClassMethods
      def find_by_sql(*)
        []
      end
    end
  end
end
