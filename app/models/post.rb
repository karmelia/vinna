class Post < ActiveRecord::Base
	has_many :comments
	has_attached_file :image, 
										styles: { small: "100x100", med: "200x200", large: "600x600"},
										storage: :s3,
										bucket: 'vinnablogphotos',
										:s3_credentials => { :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
																					:secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'] }

	validates :title, presence: true,
										length: { minimum: 2 }

	validates :text, presence: true,
										length: { minimum: 2 }
	
	validates_attachment_presence :image
	validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']


end