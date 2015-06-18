require File.expand_path("../../test_helper", __FILE__)
session = Capybara::Session.new(:selenium)

feature "Admin can create a new blog post" do 
	scenario "user logged in" do
		visit root_path
		click_on 'Log In'
		fill_in 'Email', with: users(:user).email
		fill_in 'Password', with: users(:user).password
		click_on 'Log in'
		# current_path.should == root_path
		# click_on 'Add new blog post'
		# page.has_content?('New blog post')
		# attach_file('Image', '/public/images/beer.jpg')
		# fill_in 'Title', with: 'Testing 123'
		# fill_in 'Text', with: 'testing testing testing'
		# click_on 'Create Post'
		# page.has_content('Add your comment:')
	end
end 