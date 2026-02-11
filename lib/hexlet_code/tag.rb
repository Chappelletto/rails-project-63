# frozen_string_literal: true

module HexletCode
  class Tag
    def self.build(name, attributes = {})
      singled_tags = %w[img br input]

      builded_attributes = build_attributes(attributes)

      return "<#{name}#{builded_attributes}>" if singled_tags.include? name

      "<#{name}#{builded_attributes}>#{yield}</#{name}>"
    end

    def self.build_attributes(attributes)
      attributes.compact.map do |key, value|
        " #{key}=\"#{value}\""
      end.join
    end
  end
end
