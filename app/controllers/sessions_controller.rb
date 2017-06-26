class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      flash[:notice] = "Welcome, #{user.username}"
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Username or password was incorrect"
      render :new
    end
  end

  def destroy
    flash[:notice] = "You were logged out"
    session[:user_id] = nil
    redirect_to root_path
  end
end
