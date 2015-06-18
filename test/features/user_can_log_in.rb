require File.expand_path("../../test_helper", __FILE__)

class UsersLoginTest < ActionDispatch::IntegrationTest
	test "user login with invalid information" do 
		get log_in_path
		
	end
end