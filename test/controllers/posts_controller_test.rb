require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "new should render correct layout" do 
  	get :new
  	assert_template layout: "layouts/application", partial: "_form"
  end

  test "should create a new post" do
    assert_difference("Post.count") do 
    	post :create, post: { title: "Test title", text: "Some text for the test blog post" }
    end
    assert_redirected_to post_path(assigns(:post))
  end

end
