class UsersController < ApplicationController
	before_action :logged_in_user, only: [:edit, :update]

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Success!"
			redirect_to root_path
		else
			flash[:alert] = "There was a problem creating your account. Please try again."
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
      flash[:danger] = "Please log in."
      redirect_to log_in_url
    end
  end

  helper_method :current_user

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end