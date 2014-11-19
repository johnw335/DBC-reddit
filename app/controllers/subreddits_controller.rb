class SubredditsController < ApplicationController
  def index
    @subreddits = Subreddit.all
  end

  def show
    puts params.inspect
    @subreddit = Subreddit.find(params[:id])

    @posts = @subreddit.posts
    puts "-------------------------------"
    p @posts
    # this page displays all the posts for @subredditt
  end
end
