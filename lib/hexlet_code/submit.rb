# frozen_string_literal: true

module HexletCode
  class Submit

    def initialize(features)
      @options = { type: 'submit',
                   value: features[:value] }
    end

    def render
      HexletCode::Tag.build('input', @options).to_s
    end
  end
end
