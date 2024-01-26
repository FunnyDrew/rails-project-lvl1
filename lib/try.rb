#autoload(:HexletCode, ENV['PWD'] + '/lib/hexlet_code.rb')

#HexletCode::Tag.build('tag')

#HexletCode::Tag.build('img', src: 'path/to/image')

module Tag
	def build(name)
		"tag is #{name}"
	end
end

class HexletCode
	extend Tag
end

puts HexletCode.build('img')