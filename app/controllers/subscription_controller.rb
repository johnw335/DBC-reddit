class SubscriptionController < ApplicationController

  def index
    @subscriptions = Subscription.find_by(user_id: session[:user_id])

  end
end
