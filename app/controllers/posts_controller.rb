class PostsController < ApplicationController
  def index

  end

  def show
    @post = Post.find(params[:id])
    render :'posts/show'
  end

  def new
    @post = Post.new
    @subreddit = Subreddit.find(params[:subreddit_id])
    render 'posts/new'
  end

  def create
    @post = Post.new(post_params)
    puts "======================================"
    if @post.save
      redirect_to subreddit_post_path(params[:subreddit_id], @post)
    else
      render 'posts/new'
    end
    @comments = @post.comments.all
  end

  def update
    @post = Post.find(params[:id])
    render 'posts/edit'
  end

  def destroy
    @post = Post.find(params[:id])
    subreddit = @post.subreddit
    @post.destroy
    redirect_to subreddit_path(subreddit)
  end

  private
    def post_params
      params.require(:post).permit(:author, :body, :title, :subreddit)
    end
end
