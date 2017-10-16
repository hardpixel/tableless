require 'test_helper'

class TablelessTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tableless::VERSION
  end
end
