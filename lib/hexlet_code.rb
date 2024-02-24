# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'tag.rb'
  extend Tag

  class Error < StandardError; end

  def self.form_for(user, option = {}, &block)
    init_options = {
      action: option[:url] || '#',
      method: 'post'
    }

    in_form_block = block.call(Wraper.new(user)).join

    form_options = init_options.merge(option).except(:url)

    build('form', form_options) { in_form_block }
  end

  def input(field_name, option = {})
    acc.push(build('label', { for: field_name }) { field_name.capitalize })

    init_options = {
      name: field_name,
      type: 'text',
      value: @user.public_send(field_name)
    }

    if option.include?(:as)
      init_options = {
        name: field_name,
        cols: '20',
        rows: '40'
      }
      acc.push(build('textarea', init_options.merge(option).except(:as)) { @user.public_send(field_name) })
    else
      acc.push(build('input', init_options.merge(option)))
    end
  end

  def submit(button_value = 'Save')
    init_options = {
      type: 'submit',
      value: button_value
    }
    acc.push(build('input', init_options))
  end

  class Wraper
    include HexletCode
    include HexletCode::Tag
    attr_accessor :acc

    def initialize(user)
      @user = user
      @acc = []
    end
  end
end
