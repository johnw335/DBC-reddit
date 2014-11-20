require 'rails_helper'

describe SubredditsController do
  let!(:subreddit) { Subreddit.create!(name: "sample sub", description: "sample description", moderator: User.all.sample) }

  describe "GET #index" do
    it "assigns all subreddits as @subreddits" do
      get :index
      expect(assigns(:subreddits)).to eq(Subreddit.all)
    end
  end

  describe "GET #show" do
    it "assigns the requested subreddit as @subreddit" do
      get :show, { id: subreddit.to_param }
      expect(assigns(:subreddit)).to eq(subreddit)
    end

    it "assigns the posts of that subreddit to equal @posts" do
      get :show, { id: subreddit.to_param }
      expect(assigns(:posts)).to eq(subreddit.posts)
    end
  end

  describe "GET #new" do
      it "assigns a new subreddit" do
        get :new
        expect(assigns(:subreddit)).to be_a_new(Subreddit)
      end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "creates a new subreddit" do
         subreddit_params = {subreddit: {name: "sample sub", description: "sample description", moderator: User.all.sample} }
        expect{post :create, subreddit_params}.to change{Subreddit.count}.by(1)
      end

      it "assigns a newly created subreddit as @subreddit" do
        subreddit_params = {subreddit: {name: "other sample sub", description: "sample description", moderator: User.all.sample}}
        post :create, subreddit_params
        expect(assigns(:subreddit)).to eq(Subreddit.last)
      end

      it "redirects to the created subreddit" do
        expect(redirect_to(@subreddit))
      end
    end

    context "when invalid params are passed" do
      it "assigns a newly created but unsaved subreddit as @subreddit" do
        subreddit_params = {subreddit: {name: nil, description: nil, moderator: User.all.sample}}
        expect{ post :create, subreddit_params }.to change{Subreddit.count}.by(0)
      end
    end


  end
end
