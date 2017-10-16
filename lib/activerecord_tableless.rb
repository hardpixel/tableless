require 'active_record'
require 'active_record/tableless'
require 'activerecord_tableless/connection_adapter'
require 'activerecord_tableless/version'

module ActiverecordTableless
  extend ActiveSupport::Concern

  class_methods do
    def connection
      @connection ||= ActiverecordTableless::ConnectionAdapter.new nil
    end

    def destroy(*); new.destroy end
    def destroy_all(*); [] end
    def find_by_sql(*); [] end
  end

  def reload(options = nil)
    @attributes = self.class.new.instance_variable_get("@attributes")
    @new_record = false
    self
  end

  def update(attributes)
    _run_update_callbacks do
      assign_attributes(attributes)
      save
    end
  end

  def destroy
    _run_destroy_callbacks do
      @_trigger_destroy_callback = true
      @destroyed = true
      freeze
    end
  end

  private

    def _create_record(*)
      _run_create_callbacks do
        @new_record = false
        true
      end
    end

    def _update_record(*)
      _run_update_callbacks do
        @_trigger_update_callback = true
        true
      end
    end
end
