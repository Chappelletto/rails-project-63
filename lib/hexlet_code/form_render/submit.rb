# frozen_string_literal: true

module HexletCode
  module FormRender
    # Класс для рендеринга кнопки submit
    # Генерирует HTML для кнопки отправки формы
    class Submit
      class << self
        def render(attrs)
          Tag.build('input', name: 'commit', type: 'submit', value: 'Save', **attrs)
        end
      end
    end
  end
end
