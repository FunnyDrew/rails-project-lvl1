# frozen_string_literal: true

require_relative "hexlet_code/version"
require "byebug"
require_relative "tag"

module HexletCode
  class Error < StandardError; end

  # Your code goes here...
  def self.form_for(_user, url = {})
    action_string = url.empty? ? "#" : url[:url]
    "<form action=\"#{action_string}\" method=\"post\"></form>"
  end
end
