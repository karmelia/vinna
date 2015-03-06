require "test_helper"
require "database_cleaner"

class LoginTest < Capybara::Rails::TestCase
	include Warden::Test::Helpers
	Warden.test_mode!

	setup do 
		Capybara.current_driver = :selenium
	end

	test "user can sign up" do 
		visit root_path
		click_link "User Sign Up"
		fill_in "Username", with: "UserTest"
		fill_in "Email", with: "test@test.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"
		click_button "Sign up"
		page.must_have_css("#user-log-out")
		Warden.test_reset!
	end

	test "user can log in" do 
		@user = User.new(:username => "TestUser", :email => "test@tester.com", :password => "password")
		visit root_path
		click_link "User Log In"
		fill_in "Username", with: "TestUser"
		fill_in "Email", with: "test@tester.com"
		fill_in "Password", with: "password"
		click_button "Log in"
		assert_select "li.user-log-out"
		Warden.test_reset!
	end

	test "user is already logged in" do
		@user = User.new(:username => "TestUser", :email => "test@tester.com", :password => "password")
		login_as(@user, :scope => :user) 
		visit root_path
		page.must_have_css("#user-log-out")
		Warden.test_reset!
	end
end
