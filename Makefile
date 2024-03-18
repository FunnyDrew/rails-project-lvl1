install:
	bundle install

testing: 
	ruby test/test_hexlet_code.rb

lint:
	rubocop test lib

try:
	ruby lib/try.rb