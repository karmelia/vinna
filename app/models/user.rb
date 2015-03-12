class User < ActiveRecord::Base
	attr_accessor :password
  enum access_level: [:general, :admin, :super_admin]

	validates :email, presence: true
	validates :email, uniqueness: true
	validates :password, presence: true
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
	validates_confirmation_of :password
	before_save :encrypt_password

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.authenticate(email, password)
		user = User.where(email: email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

	def self.assign_admins
		erin = User.find_by_email("erin@erin.com")
		erin.access_level = :admin
	end
   
end
