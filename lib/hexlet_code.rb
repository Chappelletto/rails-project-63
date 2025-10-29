# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Tag
    def self.build(tag_name, **attributes, &block)
      # реализация
      if block_given?
        "<#{tag_name}#{render_attributes(attributes)}>" + yield + "</#{tag_name}>"
      else
        "<#{tag_name}#{render_attributes(attributes)}/>"
      end
    end

    def self.render_attributes(attributes)
      return "" if attributes.none?

      rendered = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(" ")
      " " + rendered
    end
  end

  class Error < StandardError; end
  # Your code goes here...
end
