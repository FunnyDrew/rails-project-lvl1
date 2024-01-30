require_relative 'hexlet_code'

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'


result = HexletCode.form_for user do |f|
	f.input :name 	
end

puts result