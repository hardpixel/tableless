# frozen_string_literal: true

require 'test_helper'

class Topic < ActiveRecord::Base
  include Tableless

  has_many :messages

  attribute :title, :string
  attribute :text,  :string

  validates :title, presence: true

  accepts_nested_attributes_for :messages
end

class Message < ActiveRecord::Base
  include Tableless

  attribute :topic_id
  belongs_to :topic

  has_many :replies

  attribute :name,  :string
  attribute :email, :string

  validates :name, :email, presence: true
end

class Reply < Message
  attribute :message_id
  belongs_to :message
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

  def test_that_it_accepts_belongs_to
    top = Topic.new(title: 'Testing')
    msg = Message.new(name: 'User', email: 'user@mail.com', topic: top)

    assert_instance_of Topic, msg.topic
  end

  def test_that_it_accepts_has_many
    msg = Message.new(name: 'User')
    top = Topic.new(title: 'Testing', messages: [msg])

    assert_instance_of Message, top.messages.first
  end

  def test_that_inheritance_works
    msg = Message.new(name: 'User')
    rep = Reply.new(name: 'Replier', message: msg)

    assert_instance_of Message, rep.message
  end

  def test_that_it_accepts_nested_attributes
    top = Topic.new(title: 'Testing', messages_attributes: [{ name: 'User' }])
    assert_instance_of Message, top.messages.first
  end
end
