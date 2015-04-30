class ApplicationController < ActionController::Base

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
	  !current_user.nil?
	end

	def are_you_an_admin?
		!current_user.admin?
	end

	def logged_in_user
	  unless logged_in?
	    flash[:error] = "You are not logged in."
	    redirect_to log_in_url
	  end
	end

	def admin_user
	  unless are_you_an_admin?
	    flash[:error] = "You are not logged in as an admin."
	    redirect_to log_in_url
	  end
	end

	helper_method :current_user
end
