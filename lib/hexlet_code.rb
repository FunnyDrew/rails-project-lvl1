# frozen_string_literal: true

require_relative "hexlet_code/version"
require "byebug"
require_relative "tag"

module HexletCode
  class Error < StandardError; end

  # Your code goes here...
  def self.form_for(user, url = {}, &block)
    @object = user
    action_string = url.empty? ? "#" : url[:url]
    block.call(self)
  end

  def self.input(name, option = {})
    self::Tag.build('input', {
    :name => name,
    :type => "text",
    :value => @object.send(name)})  
  end
end

=begin
  
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  # Проверяет есть ли значение внутри name
  f.input :name
  # Проверяет есть ли значение внутри job
  f.input :job, as: :text
end

# Для удобства пример указан с переносами строк. Но реализовывать их необязательно
# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea name="job" cols="20" rows="40">hexlet</textarea>
# </form>
  
=end
