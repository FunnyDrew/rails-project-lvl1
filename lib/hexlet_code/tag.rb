# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(tag, attributes = {}, &body)
      attr_list = build_attributes(attributes)
      html = "<#{tag}#{attr_list.join}>"
      return html if SINGLE_TAGS.include? tag

      content = body.call if block_given?

      "#{html}#{content}</#{tag}>"
    end

    def self.build_attributes(attr)
      attr.map do |key, value|
        " #{key}=\"#{value}\""
      end
    end
  end
end
