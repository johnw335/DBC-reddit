class SubredditsController < ApplicationController

  def index
    @subreddits = Subreddit.all
  end

  def show
    @subreddit = Subreddit.find(params[:id])
    @subscriptions = Subscription.find_by(subreddit: @subreddit)
    @posts = @subreddit.posts.order('points DESC')

  end

  def new
    @subreddit = Subreddit.new

  end

  def create
    @subreddit = Subreddit.new(subreddit_params)

    # to do: add moderator using sessions id
    @user = User.find(session[:user_id])
    @subreddit.moderator = @user
    @user.subscriptions.create(subreddit: @subreddit)

    if @subreddit.save
      redirect_to @subreddit
    else
      render 'new'
    end
  end

  def edit
    puts params.inspect
    @subreddit = Subreddit.find(params[:id])
  end

  def update
    @subreddit = Subreddit.find(params[:id])
    # @subreddit.update(subreddit_params)
    if @subreddit.update(subreddit_params)
      redirect_to @subreddit
    else
      render 'edit'
    end
  end

  def destroy
    @subreddit = Subreddit.find(params[:id])
    @subreddit.destroy

    redirect_to subreddits_path
  end

  private
    def subreddit_params
      params.require(:subreddit).permit(:moderator, :description, :name)
    end

end
