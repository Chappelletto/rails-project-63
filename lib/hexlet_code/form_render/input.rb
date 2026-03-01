# frozen_string_literal: true

module HexletCode
  module FormRender
    class Input
      class << self
        def render(attrs)
          Label.render(attrs[:name]) do
            Tag.build("input", type: "text", **attrs)
          end
        end
      end
    end
  end
end
