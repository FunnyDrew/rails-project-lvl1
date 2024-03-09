# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def before_setup
    @path = "#{File.dirname(__FILE__)}/__fixtures__/"
  end

  def test_empty_form
    # skip
    user = User.new name: 'rob'

    file_path = "#{@path}fixture01.html"
    file = File.open(file_path)
    file_content = file.read.strip

    generated = HexletCode.form_for user do |f|
    end

    assert_equal file_content, generated
  end

  def test_empty_form_with_url
    # skip
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    file_path = "#{@path}fixture02.html"
    file = File.open(file_path)
    file_content = file.read.strip

    generated = HexletCode.form_for user, url: '/users' do |f|
    end

    assert_equal file_content, generated
  end

  def test_empty_from_with_get_and_class
    # skip
    user = User.new name: 'rob'
    file_path = "#{@path}fixture03.html"
    file = File.open(file_path)
    file_content = file.read.strip

    generated = HexletCode.form_for user, url: '/profile', method: :get, class: 'hexlet-form' do |f|
    end

    assert_equal file_content, generated
  end

  def test_simple_input_tag
    # skip
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    file_path = "#{@path}fixture0.html"
    file = File.open(file_path)
    file_content = file.read.strip

    generated = HexletCode.form_for user do |f|
      f.input :name
      f.input :job
    end

    assert_equal file_content, generated
  end

  def test_input_and_textarea
    # skip
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    file_path = "#{@path}fixture1.html"
    file = File.open(file_path)
    file_content = file.read.strip

    generated = HexletCode.form_for user do |f|
      f.input :name
      f.input :job, as: :text
    end

    assert_equal file_content, generated
  end

  def test_input_with_class
    # skip
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    file_path = "#{@path}fixture2.html"
    file = File.open(file_path)
    file_content = file.read.strip

    generated = HexletCode.form_for user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    assert_equal file_content, generated
  end

  def test_textarea_change_cols_rows
    # skip
    user = User.new name: 'rob', job: 'hexlet', gender: 'm'

    file_path = "#{@path}fixture4.html"
    file = File.open(file_path)
    file_content = file.read.strip

    generated = HexletCode.form_for user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert_equal file_content, generated
  end

  def test_submit
    # skip
    user = User.new job: 'hexlet'

    file_path = "#{@path}fixture5.html"
    file = File.open(file_path)
    file_content = file.read.strip

    generated = HexletCode.form_for user, url: '#' do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end

    assert_equal file_content, generated
  end
end
