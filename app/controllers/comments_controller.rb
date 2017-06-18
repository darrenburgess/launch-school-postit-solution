class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.creator = User.first
    @comment.post_id = params[:post_id]
    @post = Post.find(params[:post_id])
    @categories = @post.categories

    if @comment.save
      flash[:notice] = "Your comment was created"
      redirect_to @post
    else
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :user_id, :post_id)
  end
end
