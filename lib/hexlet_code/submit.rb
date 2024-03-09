# frozen_string_literal: true

class Submit
  attr_accessor :init_options, :options, :field

  def initialize(button_name)
    @field = field
    @init_options = { type: 'submit',
                      value: button_name }
    @options = options
  end

  def to_a
    { name: 'input',
      label: {},
      options: init_options,
      body: '',
      children: [] }
  end
end
