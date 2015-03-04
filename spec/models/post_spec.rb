require 'spec_helper'
require 'rails_helper'

describe "Post" do 
	it "has a valid factory" do 
		expect(build(:post)).to be_valid
	end

	it "is invalid without a title" do 
		expect(build(:post, title: nil)).to_not be_valid
	end

	it "is invalid with a short title" do 
		expect(build(:post, title: "A")).to_not be_valid
	end

	it "is invalid without text" do 
		expect(build(:post, text: nil)).to_not be_valid
	end

	it "is invalid with a short text" do 
		expect(build(:post, text: "B")).to_not be_valid
	end
end