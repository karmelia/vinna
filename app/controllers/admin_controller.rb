class AdminController < ApplicationController
  load_and_authorize_resource

  def index
  	@admins = Admin.excludes(:id => current_admin.id)
  end

  def new
  	@admin = Admin.new
  end

  def create
  	@admin = Admin.new(params[:admin])
  	if @admin.save
  		flash[:notice] = "Successfully created Admin."
  		redirect_to root_path
  	else
      flash[:message]
  		render :action => 'new'
  	end
  end

  def edit
  	@admin = Admin.find(params[:id])
  end

  def update
  	@admin = Admin.find(params[:id])
  	params[:admin].delete(:password) if params[:admin][:password].blank?
  	params[:admin].delete(:password_confirmation) if params[:admin][:password].blank? and params[:admin][:password_confirmation].blank?
  	if @admin.update_attributes(params[:admin])
  		flash[:notice] = "Successfully updates Admin."
  		redirect_to root_path
  	else
  		render :action => "edit"
  	end
  end

  def destroy
  	@admin = Admin.find(params[:id])
  	if @admin.destroy
  		flash[:notice] = "Successfully deleted Admin."
  		redirect_to root_path
  	end
  end
end
