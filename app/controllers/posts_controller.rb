class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, except: [:show, :index]
  before_action :require_creator, only: [:edit, :update]

  def index
    @posts = Post.all.sort_by {|post| post.total_votes}.reverse
  end

  def show
    @comment = @post.comments.new 
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.category_ids = post_params['category_ids']
    @post.creator = current_user

    if @post.save
      flash[:notice] = "Your post was created"
      redirect_to posts_path
    else
      render :new 
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      flash[:notice] = "Your post was updated"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def vote
    @vote = Vote.create(vote: params[:vote], voteable: @post, creator: current_user)
    @obj = @post

    respond_to do |format|
      format.html do
        if @vote.valid?
          flash[:notice] = "Your vote was counted"  
        else
          flash[:notice] = "You many only vote once for a post"  
        end

        redirect_to :back
      end

      format.js do
        render 'votes/vote'
      end
    end
  end

  private

  def require_creator
    access_denied unless allow_access?
  end

  def allow_access?
    logged_out? || (logged_in? and creator? || admin?)
  end

  def creator?
    @post.creator == current_user
  end

  def admin?
    current_user.admin?
  end

  def set_post
    @post = Post.find_by(slug: params[:id])
  end

  def post_params
    params.require(:post).permit(:url, :title, :description, category_ids: [])
  end
end
