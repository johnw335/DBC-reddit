class SubscriptionsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @subscriptions = @user.subscriptions
  end

  def new
    @subreddit = Subreddit.find(params[:id])
    @subscription = Subscription.new
  end

  def create
    @user = User.find(session[:user_id])
    @subreddit = Subreddit.find(params[:subreddit])
    @subscription = Subscription.new(subreddit: @subreddit, user: @user)
    @subscription.user = @user
    if @subscription.save
      redirect_to :back
    else
      redirect_to :back
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy!
    redirect_to :back
  end

  private
    def subscription_params
      params.require(:subscription).permit(:subreddit)
    end
end



