class UsersController < ApplicationController

  #get
  def all
    redirect_to forbidden_path if current_user == nil || !current_user.is_admin
    @users = User.all
  end

  #get
  def edit
    redirect_to forbidden_path if current_user == nil || !current_user.is_admin
    @user = User.find(params[:id])
  end

  #post
  def update
    redirect_to forbidden_path if current_user == nil || !current_user.is_admin
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path
      flash[:notice] = "User edited successfully with id: " + @user.id.to_s
    else      
      flash[:error] = "You filled out your information incorrectly."
      params[:id] =  @user.id
      render :action => "edit"
    end
  end

  #get
  def new
    redirect_to forbidden_path if current_user == nil || !current_user.is_admin
    @user = User.new
  end

  #post
  def create
    redirect_to forbidden_path if current_user == nil || !current_user.is_admin
    @user = User.new(user_params)
    if @user.save
      redirect_to users_new_path
      flash[:notice] = "User created successfully with email: " + @user.email
    else
      flash[:error] = "You filled out your information incorrectly."
      render :action => '/new'
    end
  end

  #post
  def destroy
    redirect_to forbidden_path if current_user == nil || !current_user.is_admin
    user = User.find(params[:id])
    if @current_user.id != user.id
      User.find(params[:id]).destroy
      flash[:notice] = "User deleted"
      redirect_to users_path
    else
      redirect_to users_path
      flash[:error] = "You can't delete yourself"
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
