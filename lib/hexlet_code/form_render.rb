# frozen_string_literal: true

class FormRender
  # autoload :Tag, 'tag.rb'
  def render_html(form)
    form.reduce('') do |acc, item|
      if item[:children].empty?

        unlabeled = item[:label].empty?
        label = unlabeled ? '' : HexletCode::Tag.build('label', item[:label][:options]) { item[:label][:body] }

        "#{acc}#{label}#{HexletCode::Tag.build(item[:name], item[:options]) { item[:body] }}"
      else
        "#{acc}#{HexletCode::Tag.build(item[:name], item[:options]) { render_html(item[:children]) }}"
      end
    end
  end
end
