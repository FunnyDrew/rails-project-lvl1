# frozen_string_literal: true

module HexletCode
  class FormRender
    def render_html(form)
      HexletCode::Tag.build('form', form.form_options) { children_render(form.children) }
    end

    def children_render(children)
      tags = children.map do |item|
        HexletCode.const_get(item[:tag_name].capitalize).new(item).render
      end
      tags.join
    end
  end
end
