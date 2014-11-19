class SubredditsController < ApplicationController
  def index
    @subreddit = Subreddit.find(params[:subreddit_id])
  end
end
