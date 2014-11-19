class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.all
  end

  def show
    @subreddit = Subreddit.find(params[:id])

    @posts = @subreddit.posts
  end
end
