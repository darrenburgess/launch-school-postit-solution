class CategoriesController < ApplicationController
  before_action :require_user, except: [:index]
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :edit]
  before_action :require_admin, only: [:index, :create, :edit, :destroy]

  # why is this here?
  before_action :set_categories, only: [:index]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Category was Created"
      redirect_to categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category was Updated"
      redirect_to categories_path
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    flash[:notice] = "Category was Deleted"
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find_by(slug: params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
