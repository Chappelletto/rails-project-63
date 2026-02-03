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
