require "test_helper"
require "database_cleaner"

class LoginTest < Capybara::Rails::TestCase
	include Warden::Test::Helpers
	Warden.test_mode!

	setup do 
		Capybara.current_driver = :selenium
	end

	test "admin can sign up" do 
		visit new_admin_registration_path
		fill_in "Username", with: "AdminTest"
		fill_in "Email", with: "test@test.com"
		fill_in "Password", with: "password"
		fill_in "Password confirmation", with: "password"
		click_button "Sign up"
		page.must_have_css("#admin-log-out")
		Warden.test_reset!
	end

	test "admin can log in" do 
		@admin = Admin.new(:username => "TestAdmin", :email => "test@tester.com", :password => "password")
		visit new_admin_session_path
		fill_in "Username", with: "TestAdmin"
		fill_in "Email", with: "test@tester.com"
		fill_in "Password", with: "password"
		click_button "Log in"
		assert_select "li.admin-log-out"
		Warden.test_reset!
	end

	test "admin is already logged in" do
		@admin = Admin.new(:username => "Testadmin", :email => "test@tester.com", :password => "password")
		login_as(@admin, :scope => :admin) 
		visit root_path
		page.must_have_css("#admin-log-out")
		Warden.test_reset!
	end
end