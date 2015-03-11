require "test_helper"

class UserTest < ActiveSupport::TestCase

  test "should not save user without an email or password" do 
  	user = User.new
  	assert_not user.save
  	user.email = "test@test.com"
  	assert_not user.save
  	user.password = "password"
 		assert user.save
 	end

 	test 'should not save user with invalid email' do 
	 	user = User.new
	 	assert_not user.save
	 	user.password = "password"
	 	assert_not user.save
	 	user.email = "test"
	 	assert_not user.save
	 	user.email = "test@test.com"
		assert user.save
	end

 	test 'should not save user with invalid password' do 
	 	user = User.new
	 	assert_not user.save
	 	user.email = "test@test.com"
	 	assert_not user.save
	 	user.password = ""
	 	assert_not user.save
	 	user.password = "password"
		assert user.save
	end
end
