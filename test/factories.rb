FactoryGirl.define do 
	
	factory :post do
		post_title { Faker::Lorem.word }
		post_text { Faker::Lorem.sentence }
	end

end