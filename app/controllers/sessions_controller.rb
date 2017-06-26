class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome, #{user.username}"
      redirect_to root_path
    else
      flash[:notice] = "Username or password was incorrect"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You were logged out"
    redirect_to root_path
  end
end
