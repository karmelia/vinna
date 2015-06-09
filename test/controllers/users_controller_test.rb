require File.expand_path("../../test_helper", __FILE__)


class UsersControllerTest < ActionController::TestCase

  def setup
    @user = User.new(id: "1", email: "test@test.com", password: "password")
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to log_in_url
  end

  test "should redirect update when not logged in" do
    patch :update, id: @user, user: { email: @user.email }
    assert_not flash.empty?
    assert_redirected_to log_in_url
  end
end
