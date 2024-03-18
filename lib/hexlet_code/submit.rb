# frozen_string_literal: true

module HexletCode
  class Submit
    attr_reader :init_options, :options, :tag_name

    def initialize(_name, value, _options)
      @tag_name = 'input'
      @options = { type: 'submit',
                   value: }
    end
  end
end
