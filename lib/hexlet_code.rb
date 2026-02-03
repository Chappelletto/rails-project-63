require_relative "hexlet_code/version"
require "active_support"
require "active_support/core_ext"

module HexletCode
  autoload :Tag, "hexlet_code/tag.rb"
  autoload :FormTag, "hexlet_code/form_tag.rb"
  autoload :LabelTag, "hexlet_code/label_tag.rb"
  autoload :TextareaTag, "hexlet_code/textarea_tag.rb"
  class Error < StandardError; end

  def self.form_for(object, options = {})
    form = FormTag.new(object)
    yield form if block_given?

    form.to_html
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

# User = Struct.new(:name, :job, :gender, keyword_init: true)
# user = User.new name: "rob", job: "hexlet", gender: "m"

# form_1 = HexletCode.form_for user do |form|
#   form.input :name, class: "user-input"
#   form.input :job, as: :text, cols: "50", rows: "50"
#   form.submit
#   # form.input :age
# end
# puts form_1

# # Задачи
# # Реализуйте label для каждого инпута
# # Реализуйте метод submit()
