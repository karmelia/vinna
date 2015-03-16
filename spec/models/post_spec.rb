require 'spec_helper'
require 'rails_helper'


describe Post do 
	it { should have_many(:comments) }
	it { should validate_presence_of(:title) }
	it { should validate_length_of(:title).is_at_least(2) }
	it { should validate_presence_of(:text) }
	it { should validate_length_of(:text).is_at_least(2) }

	it { should have_attached_file(:image) }
	it { should validate_attachment_presence(:image) }
	it { should validate_attachment_content_type(:image).allowing('image/jpeg', 'image/png', 'image/jpg').rejecting('text/plain', 'textxml') }
	it { should validate_attachment_size(:image).less_than(5.megabytes) } 
end
