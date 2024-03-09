# frozen_string_literal: true

class FormRender
  # autoload :Tag, 'tag.rb'
  def render_html(form)
    form.reduce('') do |acc, item|
      if item[:children].empty?

        label = make_label(item[:label])

        "#{acc}#{label}#{HexletCode::Tag.build(item[:name], item[:options]) { item[:body] }}"
      else
        "#{acc}#{HexletCode::Tag.build(item[:name], item[:options]) { render_html(item[:children]) }}"
      end
    end
  end

  def make_label(label_data)
    return '' if label_data.empty?

    HexletCode::Tag.build('label', label_data[:options]) { label_data[:body] }
  end
end
