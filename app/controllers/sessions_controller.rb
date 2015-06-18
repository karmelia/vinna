class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.authenticate(params[:email], params[:password])
		if @user
			session[:user_id] = @user.id
      redirect_to root_path
		else
			flash[:error] = @user.errors.full_messages
			redirect_to log_in_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:error] = "There was a problem logging you out. Please contact vinnalife@gmail.com for customer support."
		redirect_to root_path
	end

	def logged_in_user
	  unless logged_in?
	    flash[:error] = "You are not logged in."
	    redirect_to log_in_url
	  end
	end

end