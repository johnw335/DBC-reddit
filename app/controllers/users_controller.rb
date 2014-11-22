class UsersController < ApplicationController

  def index
  end

  def show
    @user = User.find(params[:user_id])
  end

  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url
    else
      flash.now[:error] = "Could not signup.  Please fill in all fields"
      render 'new'
    end
  end

  def edit

  end

  def updated
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:email, :username, :cohort, :password)
    end

end
