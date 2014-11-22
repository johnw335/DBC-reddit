class PostsController < ApplicationController
  def index

  end

  def search
    if params[:search]
      @results = Post.search(params[:search]).order("created_at DESC")
    end
    @subreddits = Subreddit.all
    # @search_results = Post.where(title: params[:search]) #"title ILIKE ?",
    puts "====================================================" #"%#{params[:search]}%"
    p @results
    render :'subreddits/index'
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @subreddit = @post.subreddit
    @comments = @post.comments.order('points DESC')
    render :'posts/show'
  end

  def new
    @post = Post.new
    @subreddit = Subreddit.find(params[:subreddit_id])
  end

  def create
    @subreddit =Subreddit.find(params[:subreddit_id])
    @post = Post.new(post_params)
    @post.subreddit = @subreddit
    @post.author = User.find(session[:user_id])
    if @post.save
      redirect_to subreddit_post_path(params[:subreddit_id], @post)
    else
      render 'posts/new'
    end
    @comments = @post.comments.all
  end

  def update
    @post = Post.find(params[:id])
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
