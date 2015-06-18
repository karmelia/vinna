class UsersController < ApplicationController
	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
      redirect_to root_path
		else
			flash[:error] = @user.errors.full_messages
			redirect_to :back
		end
	end

	def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    	redirect_to root_path
    else
      render 'edit'
    end
  end
  
  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_user.nil?
  end

  def logged_in_user
    unless logged_in?
      flash[:error] = "You are not logged in."
      redirect_to log_in_url
    end
  end

  helper_method :current_user

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end