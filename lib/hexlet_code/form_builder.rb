# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :children, :name, :options, :user

    def initialize(user, options = {})
      @user = user
      @name = 'form'
      url = options[:url] || '#'
      @options = { action: url, method: 'post' }.merge(options).except(:url)
      @children = []
    end

    def input(field_name, options = {})
      children << { tag_name: options.key?(:as) ? options[:as] : 'input',
                    name: field_name,
                    value: user.public_send(field_name),
                    options: }
    end

    def submit(button_name = 'Save')
      children << { tag_name: 'submit',
                    name: '',
                    value: button_name }
    end
  end
end
