class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create

    @comment = Comment.new(comment_params)

    @comment.post = Post.find(params[:post_id])
    if comment_params[:comment_id]
      puts "I MADE IT HERE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
      @comment.comment_id = comment_params[:comment_id]
      @comment.post = nil
    end
    @comment.author = User.find(1)
    parent_comment = @comment
    while parent_comment.post == nil
      parent_comment = Comment.find(parent_comment.comment_id)
    end
    if @comment.save
      redirect_to subreddit_post_path(parent_comment.post.subreddit, parent_comment.post)
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
      params.require(:comment).permit(:author, :body, :post, :comment_id)
    end
end



