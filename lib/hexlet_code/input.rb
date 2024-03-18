# frozen_string_literal: true

module HexletCode
  class Input
    attr_reader :name, :value, :options, :tag_name

    def initialize(name, value, options = {})
      @tag_name = 'input'
      @name = name
      @value = value
      init_options = { name:,
                       type: 'text',
                       value: }
      @options = init_options.merge(options)
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
