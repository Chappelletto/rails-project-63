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
