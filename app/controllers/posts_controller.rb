class PostsController < ApplicationController
  def index

  end

  def show
    @post = Post.find(params[:id])
    render :'posts/show'
  end

  def new
    @post = Post.new
    render 'posts/new'
  end

  def create
    @post = Post.new(post_params)
    puts "======================================"
    if @post.save
      redirect_to subreddit_post_path(@post.subreddit, @post)
    else
      render 'posts/new'
    end
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    subreddit = @post.subreddit
    @post.destroy
    redirect_to subreddits_path(subreddit)
  end

  private
    def post_params
      params.require(:post).permit(:author, :body, :title, :subreddit)
    end
end
