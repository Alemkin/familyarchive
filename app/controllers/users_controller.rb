class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to '/signup'
      flash[:notice] = "User created successfully with email: " + @user.email
    else
      redirect_to '/signup'
      flash[:error] = "You filled out your information incorrectly."
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
