# frozen_string_literal: true

require_relative 'hexlet_code/version'
# Главный модуль гема HexletCode
# Предоставляет DSL для генерации HTML-форм
module HexletCode
  # Модуль для генерации HTML-тегов
  # Позволяет создавать HTML-элементы с атрибутами и содержимым
  autoload :Tag, 'hexlet_code/tag'
  autoload :FormSchema, 'hexlet_code/form_schema'
  autoload :FormRender, 'hexlet_code/form_render/form'

  class << self
    def form_for(entity, **form_attrs)
      form = FormSchema.new(entity, form_attrs)
      yield form if block_given?
      FormRender::Form.render(form.schema)
    end
  end
end
