
class WelcomeController < ApplicationController

  def index
    # if session[:user_id]
      redirect_to subreddits_path
    # end
  end
end
