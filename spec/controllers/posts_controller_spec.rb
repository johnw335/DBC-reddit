require 'rails_helper'

describe PostsController do
  let!(:post) {Post.create!(title: "Bicycles are awesome", body: "about bicycles")}

  # puts "*********"
  # puts @post.title

  describe "GET #show" do
    it "assigns @post equal to a particular post" do
      get :show, { id: post.id }
      expect(assigns(:post)).to eq(post)
      puts "-----------"
      # expect(assigns(:post)).to be_a(Post)
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "assigns the subreddit of the post to the post" do
      end
    end
    context "with invalid attributes" do
      it "does not save the new post in the database" do
      end
    end
  end

end
