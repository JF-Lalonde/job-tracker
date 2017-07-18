class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username]) # If using form_for, params will be nested in params[:session][:username], etc. find_by_username is deprecated, better to use User.find_by(username: username)
    if user && user.authenticate(params[:password])
      flash[:message] = "Logged in successfully!"
      session[:user_id] = user.id #Very important: this is where a session will have info about a user
      redirect_to 'companies#index'
    else
      flash[:error] = "Invalid Login!"
      redirect_to '/login'
    end
  end

  def destroy
    flash[:message] = "Logged Out!"
    session[:user_id] = nil #Could use session.clear instead, would clear whole session info
    redirect_to '/login'
  end
end
