# frozen_string_literal: true

module HexletCode
  module Tags
    class Text
      def self.build(name, value, attrs = {})
        default_attrs = {
          cols: 20,
          rows: 40
        }

        input_attrs = default_attrs.merge(attrs)

        HexletCode::Tag.build("textarea", name:, **input_attrs) { value }
      end
    end
  end
end
