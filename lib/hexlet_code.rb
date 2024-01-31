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
    :value => @object.public_send(name)})  
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
Для полей можно указать дополнительные атрибуты в виде хеша последним параметром

HexletCode.form_for user, url: '#' do |f|
  f.input :name, class: 'user-input'
  f.input :job
end

# <form action="#" method="post">
#   <input name="name" type="text" value="rob" class="user-input">
#   <input name="job" type="text" value="hexlet">
# </form>
У полей могут быть дефолтные значения, которые можно переопределить

HexletCode.form_for user do |f|
  f.input :job, as: :text
end

# <form action="#" method="post">
#   <textarea name="job" cols="20" rows="40">hexlet</textarea>
# </form>

HexletCode.form_for user, url: '#' do |f|
  f.input :job, as: :text, rows: 50, cols: 50
end

# <form action="#" method="post">
#   <textarea cols="50" rows="50" name="job">hexlet</textarea>
# </form>

  
=end
