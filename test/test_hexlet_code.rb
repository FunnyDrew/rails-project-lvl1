# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def test_simple_input_tag
    # skip
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    file_content = load_fixture('fixture0.html')

    generated = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
    end

    assert_equal file_content, generated
  end

  def test_input_and_textarea
    # skip
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    file_content = load_fixture('fixture1.html')

    generated = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal file_content, generated
  end

  def test_input_with_class
    # skip
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    file_content = load_fixture('fixture2.html')

    generated = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    assert_equal file_content, generated
  end

  def test_textarea_change_cols_rows
    # skip
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    file_content = load_fixture('fixture3.html')

    generated = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert_equal file_content, generated
  end

  def test_submit
    # skip
    user = User.new job: 'hexlet'

    file_content = load_fixture('fixture4.html')

    generated = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    assert_equal file_content, generated
  end

  def test_form_get_options_and_submit
    # skip
    user = User.new name: 'rob'

    file_content = load_fixture('fixture5.html')

    generated = HexletCode.form_for user, url: '/profile', method: :get, class: 'hexlet-form' do |f|
      f.input :name
      f.submit
    end
    assert_equal file_content, generated
  end
end
