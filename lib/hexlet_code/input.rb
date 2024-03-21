# frozen_string_literal: true

module HexletCode
  class Input
    def initialize(features)
      init_options = { name: features[:name],
                       type: 'text',
                       value: features[:value] }
      @options = init_options.merge(features[:options])
    end

    def label_options
      { for: @options[:name] }
    end

    def label_name
      @options[:name].capitalize
    end

    def label_render
      HexletCode::Tag.build('label', label_options) { label_name }
    end

    def render
      "#{label_render}#{HexletCode::Tag.build('input', @options)}"
    end
  end
end
