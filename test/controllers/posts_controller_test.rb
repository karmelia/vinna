require File.expand_path("../../test_helper", __FILE__)

class PostsControllerTest < ActionController::TestCase
  def setup
    @user = User.new(email: "test@test.com", password: "password1", access_level: 1) 
    @post = Post.new(title: "Testing", text: "testing testing testing")
  end

  def teardown
    @post.destroy
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do 
  	get :new
  	assert_response :success
  end

  test "should create post" do
    assert_difference('Post.count') do 
    	Post.new(title: "Hello", text: 'Hi There')
    end
    assert_redirected_to post_path(assigns(:post))
  end

  test "should show post" do
    get :show, id: @post
    assert_response :success
  end

  test "should get edit" do 
    get :edit, id: @post
    assert_response :success
  end

  test "should update post" do 
    patch :update, id: @post, post: {title: "Changed title", text: "Changed text"}
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do 
      delete :destroy, id: @post
    end
    assert_redirected_to posts_path
  end
end
