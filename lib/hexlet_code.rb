# frozen_string_literal: true

require_relative "hexlet_code/version"
require "byebug"
require_relative "tag"

module HexletCode
  class Error < StandardError; end

  # Your code goes here...
  # Здесь можно добавить класс

  def self.form_for(user, url = {}, &block)
    action_string = url.empty? ? '"#"' : "\"#{url[:url]}\""
    in_form_block = block.call(Wraper.new(user)).join
    "<form action=#{action_string} method=\"post\">#{in_form_block}</form>"
  end

  def input(name, option = {})
    main_option = {
      name:,
      type: "text",
      value: @user.public_send(name)
    }
    if option.include?(:as)
      option.shift
      main_option = {
        name:,
        cols: "20",
        rows: "40"
      }
      acc.push(build("textarea", main_option.merge(option)) { @user.public_send(name) })
    else
      acc.push(build("input", main_option.merge(option)))
    end
  end

  class Wraper
    include HexletCode
    include HexletCode::Tag
    attr_accessor :acc

    def initialize(user)
      @user = user
      @acc = []
    end
  end
end
