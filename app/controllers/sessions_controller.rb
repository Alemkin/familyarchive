class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:sessions][:email].strip.downcase)
    # if the user exists AND the password entered is correct
    if user && user.authenticate(params[:sessions][:password])
      # save the user id inside the browser cookie. This is how we keep the user logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/login'
      flash[:error] = "Username or Password are incorrect."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
