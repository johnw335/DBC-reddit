require 'rails_helper'

describe PostsController do
  before do
    @post = Post.create!(title: "Test", body: "test", author: User.all.sample, subreddit: Subreddit.all.sample)
  end
  # let!(:post) { Post.create!(title: "Test", body: "test", author: User.all.sample, subreddit: Subreddit.all.sample) }
  describe "GET #show" do
    it "assigns @post equal to a particular post" do
      get :show, { subreddit: @post.subreddit, post: @post }
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "post#create" do
    it "assigns the subreddit of the post to the post" do
      # post :subreddit_posts
      # expect(assigns(:post))
    end

  end

end
