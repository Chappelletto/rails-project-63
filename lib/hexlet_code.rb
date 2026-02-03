class Tag
  attr_accessor :name, :attributes, :children

  def initialize(name, **attributes)
    @name = name
    @attributes = attributes
    @children = []
  end

  def add_children(children)
    @children << children
  end
  alias_method :<<, :add_children

  def to_html
    if @children.any?
      "<#{@name}#{render_attributes}>" + render_children + "</#{@name}>"
    else
      "<#{@name}#{render_attributes}/>"
    end
  end

  def render_attributes
    return "" if @attributes.none?

    rendered = @attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
    " " + rendered
  end

  def render_children
    @children.map { |c| c.to_html }.join
  end
end

class FormTag < Tag
  def initialize(object = nil, **attributes)
    @object = object
    default_attributes = {action: "#", method: "POST"}
    super(
      "form",
      **default_attributes.merge(attributes)
    )
  end

  def input(name, **attributes)
    as = attributes.delete(:as)
    value = @object&.public_send(name)

    id = attributes[:id] || name
    label_text = attributes.delete(:label) || name.to_s.capitalize
    label = LabelTag.new(id, label_text)

    attrs = {name: name, value: value}.merge(attributes)

    input = if as == :text
      TextareaTag.new(**attrs)
    else
      InputTag.new(**attrs)
    end

    # self << input
    # self.add_children(input)
    self << label
    add_children(input)
  end

  def submit(value = "Save", **attributes)
    attrs = {
      type: "submit",
      value: value
    }.merge(attributes)

    self << InputTag.new(**attrs)
  end
end

class LabelTag < Tag
  def initialize(for_id, text)
    super("label", for: for_id)
    @text = text
  end

  def to_html
    "<#{@name}#{render_attributes}>#{@text}</#{@name}>"
  end
end

class InputTag < Tag
  def initialize(**attributes)
    default_attributes = {type: "text", value: ""}
    super(
      "input",
      **default_attributes.merge(attributes)
    )
  end
end

class TextareaTag < Tag
  attr_accessor :value

  def initialize(**attributes)
    default_attributes = {cols: "20", rows: "40"}
    @value = attributes.delete(:value) || ""

    super(
      "textarea",
      **default_attributes.merge(attributes)
    )
  end

  def to_html
    "<#{@name}#{render_attributes}>" + @value + "</#{@name}>"
  end
end

class HexletCode
  def self.form_for(object)
    form = FormTag.new(object)
    yield form if block_given?

    form.to_html
  end
end

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
