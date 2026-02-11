# frozen_string_literal: true

module HexletCode
  module Tags
    class String
      def self.build(name, value, attrs = {})
        HexletCode::Tag.build("input", name:, type: "text", value:, **attrs)
      end
    end
  end
end
