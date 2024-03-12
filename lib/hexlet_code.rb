# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  autoload :FormRender, 'hexlet_code/form_render.rb'
  autoload :Input, 'hexlet_code/input.rb'
  autoload :TextArea, 'hexlet_code/text_area.rb'
  autoload :Submit, 'hexlet_code/submit.rb'

  def self.form_for(user, options = {}, &block)
    form = FormBuilder.new(user, options)
    block.call(form)
    FormRender.new.render_html(form.to_a)
  end
end
