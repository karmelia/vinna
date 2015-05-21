require File.expand_path("../../test_helper", __FILE__)

class UserTest < Minitest::Test

	def valid_params
		{email: "test@test.com", password: "password1"}
	end

	def test_with_valid_parmas
		user = User.new(valid_params)
		assert user.valid?, "Can't create with valid params: #{user.errors.messages}"
	end

	def test_with_invalid_email
		params = valid_params.clone
		params.delete :email
		user = User.new(params)

		refute user.valid?, "Can't be valid without email"
		assert user.errors[:email], "Missing error without email."
	end

	def test_with_invalid_password
		params = valid_params.clone
		params.delete :password
		user = User.new(params)

		refute user.valid?, "Can't be valid without password"
		assert user.errors[:password], "Missing error without password."
	end
end
