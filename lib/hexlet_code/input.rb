# frozen_string_literal: true

module HexletCode
  class Input
    attr_reader :init_options, :options, :field

    def initialize(field, options = {})
      @field = field
      @init_options = { name: field[:name],
                        type: 'text',
                        value: field[:value] }
      @options = options
    end

    def to_a
      label_name = init_options[:name]
      { name: 'input',
        label: { options: { for: label_name }, body: label_name.capitalize },
        options: init_options.merge(options),
        body: '',
        children: [] }
    end
  end
end
