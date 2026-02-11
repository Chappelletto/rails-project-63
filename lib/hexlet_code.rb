# frozen_string_literal: true

require_relative "hexlet_code/version"
# require "active_support"
# require "active_support/core_ext"

module HexletCode
  autoload :Tag, "hexlet_code/tag.rb"
  autoload :FormBuilder, "hexlet_code/form_builder.rb"
  autoload :FormRenderer, "hexlet_code/form_renderer.rb"
  autoload :Tags, "hexlet_code/tags.rb"
  class Error < StandardError; end

  def self.form_for(model, url: "#", method: "post")
    pp "#{RUBY_VERSION}-p#{RUBY_PATCHLEVEL}"
    form_builder = FormBuilder.new(model)
    yield form_builder
    FormRenderer.render(form_builder.form, url, method)
  end
end

# class HexletCode
# def self.form_for(object)
#   form = FormTag.new(object)
#   yield form if block_given?

#   form.to_html
# end
# end

# form = FormTag.new
# name_input = InputTag.new(name: "name", value: "rob")
# # job_input = InputTag.new(name: "job", value: "hexlet", as: "text")
# job_input = TextareaTag.new(name: "job", value: "hexlet")

# form << name_input
# form << job_input
# # pp form
# # puts form.to_html
# # pp ""
# # pp ""
# # pp ""
# # pp "---"

# # HexletCode.form_for user do |form_builder| # form_builder - это наш FormBuilder
# #   # Проверяет есть ли значение внутри name
# #   form_builder.input :name
# #   # Проверяет есть ли значение внутри job
# #   form_builder.input :job, as: :text
# # end

User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: "rob", job: "hexlet", gender: "m"

form_1 = HexletCode.form_for user do |form|
  form.input :name, class: "user-input"
  form.input :job, as: :text, cols: "50", rows: "50"
  form.submit
  # form.input :age
end
puts form_1

# # Задачи
# # Реализуйте label для каждого инпута
# # Реализуйте метод submit()
