class Post < ActiveRecord::Base
	has_attached_file :image, styles: { small: "100x100", med: "200x200", large: "600x600"}

	validates :title, presence: true,
										length: { minimum: 2 }

	validates :text, presence: true,
										length: { minimum: 2 }
	
	validates_attachment :image, :presence => true,
	  :content_type => { :content_type => "image/jpg" },
	  :size => { :in => 0..100.kilobytes }


end