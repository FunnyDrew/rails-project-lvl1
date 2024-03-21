# frozen_string_literal: true

module HexletCode
  class Submit
    attr_reader :init_options, :options, :tag_name

    def initialize(features)
      @options = { type: 'submit',
                   value: features[:value] }
    end

    def render
      HexletCode::Tag.build('input', @options).to_s
    end
  end
end
