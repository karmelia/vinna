class PostsController < ApplicationController 
	before_action :admin_user, only: [:new, :create, :edit, :update, :destroy]

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def index
		@posts = Post.all
	end
	
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to @post
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])

		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:image, :title, :text)
		end

		def are_you_an_admin?
			if !current_user.nil? #user is logged in
				current_user.admin? #logged in user is an admin
			end
		end

		def admin_user
		  unless are_you_an_admin?
		    flash[:error] = "You are not logged in as an admin."
		    redirect_to log_in_url
		  end
		end
end
