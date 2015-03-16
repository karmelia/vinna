require 'spec_helper'
require 'rails_helper'

describe User do 
	it { should validate_presence_of(:email) }
	it { should validate_uniqueness_of(:email) }
	it { should validate_presence_of(:password) }
	it { should validate_confirmation_of(:password) }
	it do 
		should allow_value('test@test.com', 'email@email.org').for(:email)
	end
end