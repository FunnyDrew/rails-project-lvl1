# frozen_string_literal: true

module HexletCode
  class Text
    attr_reader :name, :value, :options, :tag_name, :body

    def initialize(name, value, options = {})
      @tag_name = 'textarea'
      @name = name
      @value = value
      @body = value
      init_options = { name:,
                       cols: '20',
                       rows: '40' }
      @options = init_options.merge(options).except(:as)
    end

    def labeled?
      true
    end

    def label_options
      { for: name }
    end

    def label_name
      name.capitalize
    end
  end
end
