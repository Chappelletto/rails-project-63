# frozen_string_literal: true

module HexletCode
  module FormRender
    # Класс для рендеринга текстовой области (textarea)
    # Генерирует HTML для многострочного текстового поля
    class Text
      class << self
        def render(attrs)
          Label.render(attrs[:name]) do
            Tag.build('textarea', **{ cols: 20, rows: 40, **attrs }.except(:as, :value)) do
              attrs[:value]
            end
          end
        end
      end
    end
  end
end
