# frozen_string_literal: true

require 'test_helper'

class Message < ActiveRecord::Base
  include Tableless

  attribute :name,  :string
  attribute :email, :string

  validates :name, :email, presence: true
end

class TablelessTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Tableless::VERSION
  end

  def test_that_where_returns_empty_array
    res = Message.where(name: 'User')
    assert_equal [], res
  end

  def test_that_find_by_returns_nil
    res = Message.find_by(name: 'User')
    assert_nil res
  end

  def test_that_find_raises_an_error
    assert_raises ActiveRecord::RecordNotFound do
      Message.find(name: 'User')
    end
  end

  def test_that_it_detects_invalid_input
    msg = Message.new(name: 'User')
    refute msg.valid?
  end

  def test_that_it_detects_valid_input
    msg = Message.new(name: 'User', email: 'user@mail.com')
    assert msg.valid?
  end

  def test_that_create_returns_record
    msg = Message.create(name: 'User', email: 'user@mail.com')
    assert_instance_of Message, msg
  end
end
