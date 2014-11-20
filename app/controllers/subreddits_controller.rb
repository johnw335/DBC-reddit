class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.all
  end

  def show
    @subreddit = Subreddit.find(params[:id])

    @posts = @subreddit.posts
    # this page displays all the posts for @subredditt
  end
end
