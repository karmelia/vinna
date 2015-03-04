FactoryGirl.define do 
	factory :post do 
		title { Faker::Lorem.word }
		text { Faker::Lorem.sentence }
	end
end