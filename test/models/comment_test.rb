require File.expand_path("../../test_helper", __FILE__)

class CommentTest < ActiveSupport::TestCase
	def valid_params
		{author_name: "Testy_McTester@email.com", body: "Hello I am a testing comment dur dur dur."}
	end

	def test_with_valid_params
		comment = Comment.new(valid_params)
		assert comment.valid?, "Can't create with valid params: #{comment.errors.messages}"
	end
end
