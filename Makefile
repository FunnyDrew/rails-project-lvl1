install:
	bundle install

testing: 
	ruby test/test_hexlet_code.rb

lint:
	rubocop -a lib test

try:
	ruby lib/try.rb