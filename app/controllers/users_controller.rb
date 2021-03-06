class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit]

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
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile was updated"
      redirect_to user_path(@user.slug)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by(slug: params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:error] = "You are not allowed to edit other users"
      redirect_to root_path
    end
  end

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :timezone)
  end
end
