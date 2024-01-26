install:
	bundle install

testing: 
	ruby test/test_hexlet_code.rb

rubocop:
	rubocop lib/hexlet_code.rb