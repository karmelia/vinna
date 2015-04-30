class CommentsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]
	before_action :admin_user, only: [:destroy]
	
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		redirect_to post_path(@post)
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private
	def comment_params
		params.require(:comment).permit(:author_name, :body)
	end

	def are_you_an_admin?
		if !current_user.nil?
			current_user.admin?
		end
	end

	def logged_in_user
	  if current_user.nil?
	    flash[:error] = "You must be logged in to create a comment."
	    redirect_to log_in_url
	  end
	end

	def admin_user
	  unless are_you_an_admin?
	    flash[:error] = "You must be logged in as an admin to do that."
	    redirect_to log_in_url
	  end
	end
end
