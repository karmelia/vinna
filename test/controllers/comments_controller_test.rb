require File.expand_path("../../test_helper", __FILE__)

class CommentsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should create a new comment" do
    assert_difference("Comment.count") do 
    	post :create, comment: { author_name: "email@email.com", body: "Some comment text." }
    end
    assert_redirected_to post_path(assigns(:post))
  end
end