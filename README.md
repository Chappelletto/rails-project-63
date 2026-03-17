### Hexlet tests and linter status:
[![Actions Status](https://github.com/Chappelletto/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/Chappelletto/rails-project-63/actions)

# HexletCode

Генератор форм – DSL, с помощью которого удобно генерировать формы. Эта библиотека берет на себя задачи, которые обычно требуют написания большого количества шаблонного кода, например, обработку ошибок.

## Установка

```bash
git clone https://github.com/Chappelletto/rails-project-63.git
cd rails-project-63
make install
```

## Развёртывание

После клонирования репозитория выполните `bin/setup` для установки зависимостей проекта. Затем запустите `rake test` для выполнения тестов. Также вы можете запустить `bin/console` для интерактивной консоли, в которой можно экспериментировать с кодом.

Чтобы установить гем локально на вашу машину, выполните `bundle exec rake install`. Для публикации новой версии обновите номер версии в файле `version.rb`, затем выполните `bundle exec rake release`

Запуск линтера:
```
rubocop
```
Запуск тестов:
```
rake test
```

Интерактивная консоль:
```
bin/console
```

## Использование

```
require 'hexlet_code'

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end
```

## Лицензия

Данный гем доступен как открытый исходный код в соответствии с условиями лицензии.[MIT License](https://opensource.org/licenses/MIT).
