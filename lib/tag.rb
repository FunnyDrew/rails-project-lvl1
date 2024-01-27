# frozen_string_literal: true

module HexletCode
  module Tag
    SINGLE_TAGS = %w[br img input].freeze

    def self.build(tag, arg = {}, &body)
      init = ["<#{tag}"]
      acc = init + arg_pack(arg)
      if SINGLE_TAGS.include? tag
        html = "#{acc.join(" ")}>"
      else
        content = body.call if block_given?
        html = acc.join(" ") + ">#{content}</#{tag}>"
      end
      html
    end

    def self.arg_pack(arg)
      atributes = []
      arg.each do |key, value|
        atributes << ("#{key}=\"#{value}\"")
      end
      atributes
    end
  end
end
