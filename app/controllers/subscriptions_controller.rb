class SubscriptionsController < ApplicationController

  def index
    @user = User.find(session[:user_id])
    @subscriptions = @user.subscriptions

  end

end
