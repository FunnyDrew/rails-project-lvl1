# frozen_string_literal: true

module HexletCode
  class Text
    def initialize(features)
      @body = features[:value]
      init_options = { name: features[:name],
                       cols: '20',
                       rows: '40' }
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
      "#{label_render}#{HexletCode::Tag.build('textarea', @options) { @body }}"
    end
  end
end
