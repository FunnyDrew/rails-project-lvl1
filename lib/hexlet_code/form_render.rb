# frozen_string_literal: true

module HexletCode
  class FormRender
    def render_html(form)
      HexletCode::Tag.build('form', form.form_options) { children_render(form.children) }
    end

    def children_render(children)
      tags = children.map do |item|
        tag = HexletCode.const_get(item[:tag_name].capitalize).new(item[:name], item[:value], item[:options])
        body = tag.respond_to?(:body) ? tag.body : ''
        "#{label(tag)}#{HexletCode::Tag.build(tag.tag_name, tag.options) { body }}"
      end
      tags.join
    end

    def label(tag)
      tag.respond_to?(:labeled?) ? (HexletCode::Tag.build('label', tag.label_options) { tag.label_name }) : ''
    end
  end
end
