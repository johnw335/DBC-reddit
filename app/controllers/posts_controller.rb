class PostsController < ApplicationController
  def index

  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.all
    render :'post/show'
  end

  def create
  end

  def update
  end

  def destroy
  end

end
