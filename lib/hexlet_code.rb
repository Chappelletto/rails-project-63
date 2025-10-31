# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Tag
    def self.build(tag_name, **attributes, &block)
      # реализация
      if block_given?
        "<#{tag_name}#{render_attributes(attributes)}>" + yield + "</#{tag_name}>"
      else
        "<#{tag_name}#{render_attributes(attributes)}></#{tag_name}>"
      end
    end

    def self.render_attributes(attributes)
      return "" if attributes.none?

      rendered = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
      " " + rendered
    end
  end

  def self.form_for(user, **attributes)
    default_attributes = {action: "#", method: "post"}
    if attributes[:url]
      attributes[:action] = attributes[:url]
      attributes.delete(:url)
    end

    # default_attributes.merge(attributes)

    Tag.build("form", **default_attributes.merge(attributes))
  end

  class Error < StandardError; end
  # Your code goes here...
end

# puts user.name
#=> rob
# pp HexletCode::Tag.build("br")
# pp HexletCode.form_for("")

# <br/>
# <p>text</p>
# <div class="button" data-link="https://ya.ru"/>
# <div class="button" data-link="https://ya.ru"> text </div>
