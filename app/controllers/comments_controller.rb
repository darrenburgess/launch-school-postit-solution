class CommentsController < ApplicationController
  before_action :require_user

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.author = current_user
    @categories = @post.categories

    if @comment.save
      flash[:notice] = "Your comment was created"
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end

  def vote
    @comment = Comment.find(params[:id])
    @vote = Vote.create(vote: params[:vote], voteable: @comment, user: current_user)

    if @vote.valid?
      flash[:notice] = "Your vote was counted"
    else
      flash[:notice] = "You may only vote once for a comment"
    end

    redirect_to :back
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
