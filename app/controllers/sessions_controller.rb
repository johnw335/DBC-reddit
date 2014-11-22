class SessionsController < ApplicationController
  def new
    @subreddits = Subreddit.all
  end

  def create
    # find user
    @user = User.find_by(email: params[:session][:email])
    # authenticate user
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_url, :notice=> "Logged in"
    else
      flash.now[:error] = "Invalid email or password"
      # @errors = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
