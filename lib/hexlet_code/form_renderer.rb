# frozen_string_literal: true

module HexletCode
  class FormRenderer
    def self.render(form, url, method)
      inputs = build_inputs(form[:inputs])
      submit_button = nil

      if form.fetch(:submit)
        submit_button = HexletCode::Tag.build(
          "input",
          name: "commit",
          type: "submit",
          value: form.dig(:submit, :value)
        )
      end

      HexletCode::Tag.build("form", action: url, method:) { inputs.append(submit_button).compact.join }
    end

    def self.build_inputs(inputs_data)
      inputs_data.map do |input|
        name, value, type, attrs = input.values_at(:name, :value, :type, :attrs)
        label = HexletCode::Tag.build("label", for: name) { name.capitalize }

        tag_class = Object.const_get("HexletCode::Tags::#{type.capitalize}")

        [label, tag_class.build(name, value, attrs)].join
      end
    end
  end
end
