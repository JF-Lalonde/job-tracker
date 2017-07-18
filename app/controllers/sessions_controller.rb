class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user && user.authenticate(params[:password])
      flash[:message] = "Logged in successfully!"
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash[:error] = "Invalid Login!"
      redirect_to '/login'
    end
  end

  def destroy
    flash[:message] = "Logged Out!"
    session[:user_id] = nil
    redirect_to '/login'
  end
end
