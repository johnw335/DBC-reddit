class VotesController < ApplicationController
  def create

    if params[:comment_id] != nil
      @comment = Comment.find(params[:comment_id])
    elsif params[:post_id] != nil
      @post = Post.find(params[:post_id])
    end


    # if the user is not logged in when they vote, show error message.
    if current_user == nil
      flash[:vote_error] = true

    # if the vote is on a post do this:
    elsif @post
      @vote = Vote.create(post: @post, up: params[:up])
      @vote.voter = current_user
      # @subreddit = @post.subreddit
      if @vote.save && @vote.up == true
        @post.update(points: @post.points + 1)
      elsif @vote.save && @vote.up == false
        @post.update(points: @post.points - 1)
      end

    # if the vote is on a comment do this:
    elsif @comment
      @vote = Vote.create(comment: @comment, up: params[:up])
      @vote.voter = current_user
      if @vote.save && @vote.up == true
        @comment.update(points: @comment.points + 1)
      elsif @vote.save && @vote.up == false
        @comment.update(points: @comment.points - 1)
      end
      # @post = get_parent_comment(@comment).post
      # @subreddit = @post.subreddit
    end
    redirect_to(:back)

    # session[:return_to] ||= request.referer
    # redirect_to session.delete(:return_to)
  end

end
