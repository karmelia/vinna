require 'test_helper'

describe Post do 
  let(:post_params){ { title: "Test Blog Post Title", text: "Here is some text for testing the blog posts." }
  }
  let(:post){ Post.new post_params }

  it "is valid with valid params" do
  	post = Post.new post_params
  	post.must_be :valid?
  end

  it "is invalid without title" do
  	params = post_params.clone
  	params.delete :title
  	post = Post.new params

  	post.wont_be :valid?
  	post.errors[:title].must_be :present?
  end

  it "is invalid without text" do
  	params = post_params.clone
  	params.delete :text
  	post = Post.new params

  	post.wont_be :valid?
  	post.errors[:text].must_be :present?
  end
end
