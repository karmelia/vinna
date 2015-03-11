require "test_helper"

class UserTest < ActiveSupport::TestCase

  def user
    @user ||= User.new
  end

  test "should not save user without email or password" do 
  	user = User.new
  	assert_not user.save
  	user.email = "test@test.com"
  	assert_not user.save
  	user.password = "password"
 		assert user.save
 	end
end
