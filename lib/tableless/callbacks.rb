# frozen_string_literal: true

module Tableless
  module Callbacks
    extend ActiveSupport::Concern

    def destroy
      _run_destroy_callbacks { super }
    end

    private

    def _create_record
      _run_create_callbacks { super }
    end

    def _update_record(*)
      _run_update_callbacks { super }
    end
  end
end
