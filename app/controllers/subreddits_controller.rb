class SubredditsController < ApplicationController
  def index
<<<<<<< HEAD
    @subreddits = Subreddit.all
  end

  def show
    @subreddit = Subreddit.find(params[:id])

    @posts = @subreddit.posts
=======
    @subreddit = Subreddit.find(params[:subreddit_id])
>>>>>>> added delete, improved show
  end
end
