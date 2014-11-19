class WelcomeController < ApplicationController

  def index
    if session[:user_id]
      redirect_to subscription_path
  end
end
