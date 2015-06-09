require File.expand_path("../../test_helper", __FILE__)

feature "User can sign up for an account" do 
	scenario "new user signs up" do
		visit root_path
		click_on 'Sign Up'
		fill_in 'Email', with: 'erintesting@gmail.com'
		fill_in 'Password', with: 'Password1'
		fill_in 'Password confirmation', with: 'Password1'
		click_on 'Sign up'

		page.has_css?('.banner')
	end
end


feature "Existing users can log in" do 
	scenario "visitor is admin" do 
		visit root_path

		click_on 'Log In'
		fill_in 'Email', with: users(:admin).email
		fill_in 'Password', with: users(:admin).password
		click_on 'Log in'

		page.has_content?('Add new blog post')
	end

	scenario "visitor is general user" do 
		visit root_path

		click_on 'Log In'
		fill_in 'Email', with: users(:user).email
		fill_in 'Password', with: users(:user).password
		click_on 'Log in'

		page.has_content?('Hello, user@user.com')
	end
end
