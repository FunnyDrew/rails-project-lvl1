# frozen_string_literal: true

require_relative 'hexlet_code/version'
require_relative 'tag'

module HexletCode
  extend Tag
  class Error < StandardError; end

  def self.form_for(user, option = {}, &block)
    main_option = {
      action: option[:url] || '#',
      method: 'post'
    }

    in_form_block = block.call(Wraper.new(user)).join

    # "<form action=#{action_string} method=\"post\">#{in_form_block}</form>"
    option.shift

    build('form', main_option.merge(option)) { in_form_block }
  end

  def input(field_name, option = {})
    acc.push(build('label', { for: field_name }) { field_name.capitalize })

    main_option = {
      name: field_name,
      type: 'text',
      value: @user.public_send(field_name)
    }
    if option.include?(:as)
      option.shift
      main_option = {
        name: field_name,
        cols: '20',
        rows: '40'
      }
      acc.push(build('textarea', main_option.merge(option)) { @user.public_send(field_name) })
    else
      acc.push(build('input', main_option.merge(option)))
    end
  end

  def submit(button_value = 'Save')
    init_form = {
      type: 'submit',
      value: button_value
    }
    acc.push(build('input', init_form))
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
