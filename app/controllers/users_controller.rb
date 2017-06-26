class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.username}"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find_by(username: user_params[:username])

    if @user.update(user_params)
      flash[:notice] = "Your profile was updated"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
