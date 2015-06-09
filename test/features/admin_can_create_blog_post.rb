require File.expand_path("../../test_helper", __FILE__)

feature "Admin can create a new blog post" do 
	scenario "admin logged in" do
		visit root_path

		click_on 'Log In'
		fill_in 'Email', with: users(:admin).email
		fill_in 'Password', with: users(:admin).password
		click_on 'Log in'

		click_on 'Add new blog post'
		page.has_content?('New blog post')

		attach_file('Image', '/public/images/beer.jpg')
		fill_in 'Title', with: 'Testing 123'
		fill_in 'Text', with: 'testing testing testing'
		click_on 'Create Post'

		page.has_content('Add your comment:')
	end
end 