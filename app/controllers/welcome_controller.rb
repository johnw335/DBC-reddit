
class WelcomeController < ApplicationController

  def index

    # @user = User.find(session[:user_id])
    if session[:user_id]
      redirect_to subscriptions_path
    else
      redirect_to subreddits_path
    end

  end
end
