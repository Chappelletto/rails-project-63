### Hexlet tests and linter status:
[![Actions Status](https://github.com/Chappelletto/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Chappelletto/rails-project-63/actions)

# HexletCode

Генератор форм – DSL, с помощью которого удобно генерировать формы. Эта библиотека берет на себя задачи, которые обычно требуют написания большого количества шаблонного кода, например, обработку ошибок.

## Installation

```bash
git clone https://github.com/Chappelletto/rails-project-63.git
cd rails-project-63
make install
```

## Usage

require 'hexlet_code'

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end

## Development

Установка зависимостей:
bundle exec rake install

Запуск линтера:
rubocop

Запуск тестов:
rake test

Интерактивная консоль:
bin/setup

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/hexlet_code/blob/main/CODE_OF_CONDUCT.md).
