module Tableless
  module Persistence
    extend ActiveSupport::Concern

    module ClassMethods
      def destroy(*)
        new.destroy
      end

      def destroy_all(*)
        []
      end
    end

    def reload(*)
      @attributes = self.class.new.instance_variable_get('@attributes')
      @new_record = false
      self
    end

    def update(attributes)
      assign_attributes(attributes)
      save
    end

    def destroy
      @_trigger_destroy_callback = true
      @destroyed = true
      reload and freeze
    end

    private

    def _create_record(*)
      @new_record = false
      true
    end

    def _update_record(*)
      @_trigger_update_callback = true
      true
    end
  end
end
