# frozen_string_literal: true

require 'test_helper'

class HexletCodeTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_form_builder_with_empty_body
    user = create_user
    assert { HexletCode.form_for(user) == load_fixture('empty_form.html') }
  end

  def test_form_builder_wit_fields
    user = create_user
    expected_form = load_fixture('form.html')
    form = HexletCode.form_for user, url: '/users' do |f|
      f.input :name
      f.input :job, as: :text
      f.submit
    end
    assert { form == expected_form }
  end

  def test_with_custom_class
    # Тест с кастомным классом — проверить, что дополнительные атрибуты работают
    user = create_user
    form = HexletCode.form_for(user) { |f| f.input :name, class: 'user-input' }
    assert form.include?('class="user-input"')
  end

  def test_with_non_existent_field
    # Тест на ошибку при несуществующем поле
    user = create_user
    assert_raises(NoMethodError) { HexletCode.form_for(user) { |f| f.input :age } }
  end
end
