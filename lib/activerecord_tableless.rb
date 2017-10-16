require 'active_record'
require 'tableless/version'

module Tableless
  autoload :Connection,  'tableless/connection'
  autoload :Querying,    'tableless/querying'
  autoload :Persistence, 'tableless/persistence'
  autoload :Callbacks,   'tableless/callbacks'

  extend ActiveSupport::Concern

  included do
    include Tableless::Connection
    include Tableless::Persistence
    include Tableless::Querying
    include Tableless::Callbacks
  end
end
