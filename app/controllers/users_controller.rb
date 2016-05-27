class UsersController < ApplicationController

  #get 
  def new
    redirect_to '/forbidden' if current_user == nil || !current_user.is_admin
    @user = User.new
  end

  #post
  def create
    redirect_to '/forbidden' if current_user == nil || !current_user.is_admin
    @user = User.new(user_params)
    if @user.save
      redirect_to '/signup'
      flash[:notice] = "User created successfully with email: " + @user.email
    else
      redirect_to '/signup'
      flash[:error] = "You filled out your information incorrectly."
    end
  end

  #post
  def destroy
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
