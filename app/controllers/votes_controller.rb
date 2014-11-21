class VotesController < ApplicationController
  def create
    if params[:comment_id] != nil
      @comment = Comment.find(params[:comment_id])
    elsif params[:post_id] != nil
      @post = Post.find(params[:post_id])
    end

    if @post
      @vote = Vote.create(post: @post, up: params[:up])
      @vote.voter = current_user
      @subreddit = @post.subreddit

      @post.update(points: @post.net_votes)

      if params[:outside_post] == "true"
        redirect_to subreddit_path(@subreddit)
      else
        redirect_to subreddit_post_path(@subreddit, @post)
      end
    elsif @comment
      @vote = Vote.create(comment: @comment, up: params[:up])
      @vote.voter = current_user
      @post = get_parent_comment(@comment).post
      @subreddit = @post.subreddit

      @comment.update(points: @comment.net_votes)

      redirect_to subreddit_post_path(@subreddit, @post)
    end
  end

  def destroy
  end

end
