require 'active_record'
require 'activerecord_tableless/version'

module ActiverecordTableless
  autoload :Connection,  'activerecord_tableless/connection'
  autoload :Querying,    'activerecord_tableless/querying'
  autoload :Persistence, 'activerecord_tableless/persistence'
  autoload :Callbacks,   'activerecord_tableless/callbacks'

  extend ActiveSupport::Concern

  included do
    include ActiverecordTableless::Connection
    include ActiverecordTableless::Persistence
    include ActiverecordTableless::Querying
    include ActiverecordTableless::Callbacks
  end
end
