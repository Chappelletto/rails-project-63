# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :form

    def initialize(model)
      @model = model
      @form = {
        inputs: [],
        submit: nil
      }
    end

    def input(name, **attrs)
      input_type = attrs.fetch(:as, :string)
      value = @model.public_send(name)

      @form[:inputs] << {
        name:,
        type: input_type,
        value:,
        attrs: attrs.except(:as)
      }
    end

    def submit(value = "Save")
      @form[:submit] = {
        value:
      }
    end
  end
end
