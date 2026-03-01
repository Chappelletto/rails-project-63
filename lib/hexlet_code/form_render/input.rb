# frozen_string_literal: true

module HexletCode
  module FormRender
    # Класс для рендеринга поля ввода (input)
    # Генерирует HTML для текстовых полей с label
    class Input
      class << self
        def render(attrs)
          Label.render(attrs[:name]) do
            Tag.build('input', type: 'text', **attrs)
          end
        end
      end
    end
  end
end
