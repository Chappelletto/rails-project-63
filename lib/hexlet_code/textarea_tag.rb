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
