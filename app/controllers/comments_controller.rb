class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = Post.find(params[:post_id])
    @comment.author = User.find(1)
    if @comment.save
      redirect_to subreddit_post_path(@comment.post.subreddit, @comment.post)
    else
      # render 'comments/new'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy
    redirect_to subreddit_post_path(post.subreddit_id, post.id)
  end

  def update
    @comment = Comment.find(params[:id])
    render 'edit'
  end

  private
    def comment_params
      params.require(:comment).permit(:author, :body, :post)
    end
end
