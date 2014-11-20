require 'rails_helper'

describe SubredditsController do

  describe "GET #index" do
    it "assigns all subreddits as @subreddits" do
      get :index
      expect(assigns(:subreddits)).to eq(Subreddit.all)
    end
  end

  # describe "GET #show" do
  #   it "assigns @subreddit equal to a particular subreddit" do
  #     get :show, {id: subreddit.to_param}
  #     expect(assigns(:subreddit)).to eq(subreddit)
  #   end
  # end

end
