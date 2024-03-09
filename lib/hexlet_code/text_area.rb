# frozen_string_literal: true

class TextArea
  attr_accessor :init_options, :options, :field

  def initialize(field, options = {})
    @field = field
    @init_options = { name: field[:name],
                      cols: '20',
                      rows: '40' }
    @options = options
  end

  def to_a
    label_name = init_options[:name]
    { name: 'textarea',
      label: { options: { for: label_name }, body: label_name.capitalize },
      options: init_options.merge(options).except(:as),
      body: field[:value],
      children: [] }
  end
end
