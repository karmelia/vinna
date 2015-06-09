require File.expand_path("../../test_helper", __FILE__)

class Post_Test < ActiveSupport::TestCase

  def valid_params
    {title: "Test Title", text: "Lorem ipsum dolor est blah blah blah blah."}
  end

  def test_with_valid_params
    post = Post.new(valid_params)
    assert post.valid?, "Can't create with valid params: #{post.errors.messages}"
  end

  def test_with_null_title
    params = valid_params.clone
    params.delete :title
    post = Post.new(params)

    refute post.valid?, "Can't be valid without title"
    assert post.errors[:title], "Missing error without title."
  end

  def test_with_null_text
    params = valid_params.clone
    params.delete :text
    post = Post.new(params)

    refute post.valid?, "Can't be valid without text"
    assert post.errors[:text], "Missing error without text."
  end

  # def test_with_large_attachment
  # end
end

