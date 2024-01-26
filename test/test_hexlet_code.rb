# frozen_string_literal: true

require_relative "test_helper"

class TestHexletCode < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_br_tag
    # skip
    assert_equal "<br>", HexletCode::Tag.build("br")
  end

  def test_img_tag
    # skip
    assert_equal '<img src="path/to/image">', HexletCode::Tag.build("img", src: "path/to/image")
  end

  def test_input_tag
    # skip
    assert_equal '<input type="submit" value="Save">', HexletCode::Tag.build("input", type: "submit", value: "Save")
  end

  def test_label_tag
    # skip
    assert_equal "<label>Email</label>", HexletCode::Tag.build("label") { "Email" }
  end

  def test_div_tag
    # skip
    assert_equal "<div></div>", HexletCode::Tag.build("div")
  end

  def test_div_tag_with_arg
    # skip
    assert_equal HexletCode::Tag.build("div") { "Article" }, "<div>Article</div>"
  end
end
