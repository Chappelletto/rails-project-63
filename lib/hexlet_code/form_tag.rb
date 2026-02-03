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
