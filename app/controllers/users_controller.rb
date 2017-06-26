class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Your account was created"
      redirect_to root_path
      # TO DO: redirect to login page
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def set_user
    @user = User.find(user_params[:id])
  end

  def user_params
    params.require(:user).permit!
  end
end