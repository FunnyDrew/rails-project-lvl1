# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :children, :form_options

    def initialize(entity, options = {})
      @entity = entity
      url = options[:url] || '#'
      @form_options = { action: url, method: 'post' }.merge(options).except(:url)
      @children = []
    end

    def input(field_name, options = {})
      children << { tag_name: options.key?(:as) ? options[:as] : 'input',
                    name: field_name,
                    value: @entity.public_send(field_name),
                    options: options.except(:as) }
    end

    def submit(button_name = 'Save')
      children << { tag_name: 'submit',
                    name: '',
                    value: button_name }
    end
  end
end
