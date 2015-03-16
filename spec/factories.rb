FactoryGirl.define do 
	factory :post do 
		image Rack::Test::UploadedFile.new(Rails.root + 'public/images/art.jpg', 'image/jpg')
		title "Test Title"
		text "Test blog post blah blah blah blah."
	end

	factory :comment do 
		post
		author_name "Test Comment Leaver"
		body "blah blah blah here are my opinions about this thing blah blah blah."
	end
end