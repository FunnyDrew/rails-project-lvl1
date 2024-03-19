# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(tag, attributes = {}, &body)
      html = "<#{tag}#{build_attributes(attributes).join}>"
      return html if SINGLE_TAGS.include? tag

      content = body.call if block_given?

      "#{html}#{content}</#{tag}>"
    end

    def self.build_attributes(attributes)
      attributes.map do |key, value|
        " #{key}=\"#{value}\""
      end
    end
  end
end
