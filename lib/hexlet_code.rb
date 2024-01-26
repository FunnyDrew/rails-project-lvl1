# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end

  # Your code goes here...
  require "byebug"
  module Tag
    SINGLE_TAGS = ["br", "img", "input"]

    def self.build(tag, arg = {}, &body)
      init = ["<#{tag}"]
      if SINGLE_TAGS.include? tag
        acc = init + arg_pack(arg)
        html = "#{acc.join(" ")}>"
      else
        content = body.call if block_given?
        acc = init + arg_pack(arg)
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

# block_given?
