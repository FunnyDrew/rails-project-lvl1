# frozen_string_literal: true

class FormBuilder
  attr_accessor :children, :name, :options, :user

  def initialize(user, options = {})
    @user = user
    @name = 'form'
    url = options[:url] || '#'
    @options = { action: url, method: 'post' }.merge(options).except(:url)
    @children = []
  end

  def input(field_name, options = {})
    field = { name: field_name,
              value: user.public_send(field_name) }
    input_tag = options.key?(:as) ? TextArea.new(field, options) : Input.new(field, options)
    children << input_tag.to_a
  end

  def submit(button_name = 'Save')
    input_tag = Submit.new(button_name)
    children << input_tag.to_a
  end

  def to_a
    [{ name:, label: {}, body: '', options:, children: }]
  end
end
