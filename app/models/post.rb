class Post < ActiveRecord::Base
	has_many :comments
	has_attached_file :image,
										styles: { small: "100x100", med: "200x200", large: "600x600"}

	validates :title, presence: true

	validates :text, presence: true
	
	validates_attachment_presence :image
	validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']

end