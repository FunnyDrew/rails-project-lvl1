[![hexlet-check](https://github.com/FunnyDrew/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/FunnyDrew/rails-project-lvl1/actions/workflows/hexlet-check.yml)

[![CI](https://github.com/FunnyDrew/rails-project-lvl1/actions/workflows/main.yml/badge.svg)](https://github.com/FunnyDrew/rails-project-lvl1/actions/workflows/main.yml)
# HexletCode

Student Project maked during education of Hexlet Ruby specialization.

## Installation

    $ gem install HexletCode

## Usage

Simple example of library usage:
```
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end
```
will generate html:
```
<form action="#" method="post"><label for="name">Name</label><input name="name" type="text" value="rob"><label for="job">Job</label><textarea name="job" cols="20" rows="40">hexlet</textarea></form>
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/master/CODE_OF_CONDUCT.md).
