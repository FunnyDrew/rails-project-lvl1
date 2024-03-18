# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  autoload :Tag, 'hexlet_code/tag.rb'
  autoload :FormBuilder, 'hexlet_code/form_builder.rb'
  autoload :FormRender, 'hexlet_code/form_render.rb'
  autoload :Input, 'hexlet_code/input.rb'
  autoload :Text, 'hexlet_code/text.rb'
  autoload :Submit, 'hexlet_code/submit.rb'

  def self.form_for(entity, options = {}, &block)
    form = FormBuilder.new(entity, options)
    block.call(form)
    FormRender.new.render_html(form)
  end
end
