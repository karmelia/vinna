require File.expand_path("../../test_helper", __FILE__)

class Post_Test < ActiveSupport::TestCase

  def valid_params
    {image: File.new('test/fixtures/art.jpg'), title: "Test Title", text: "Lorem ipsum dolor est blah blah blah blah."}
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

  def test_with_no_attachment
    params = valid_params.clone
    params.delete :image
    post = Post.new(params)

    refute post.valid?, "Can't be valid without image"
    assert post.errors[:text], "Missing error without image."
  end


  def test_with_large_attachment
    params = {image: File.new('public/images/vinna_banner.jpg'), title: "Test Title", text: "Lorem ipsum dolor est blah blah blah blah."}
    post = Post.new(params)

    refute post.valid?, "Image is too large"
    assert post.errors[:text], "Missing error for image too large."
  end
end

