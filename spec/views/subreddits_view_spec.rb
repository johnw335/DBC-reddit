require 'rails_helper'

feature "creating subreddits" do
  before do
    User.create!(email: "test@gmail.com", username: "test", cohort: "Wolves", password: "catscats")
  end
  scenario "user can't open new subreddit without login in" do
    visit '/'
    expect(page).to_not have_text("Add New Subreddit")
  end

  scenario "user can create a new subreddit" do
    visit '/'
    fill_in 'email', :with => 'test@gmail.com'
    fill_in 'password', :with => 'catscats'
    click_on 'Login'
    click_on 'Add New Subreddit'
    fill_in 'Name', :with => 'Rspec sucks'
    fill_in 'Description', :with => 'Rspec is kind of a jerk'
    click_on 'Save Subreddit'
    expect(page).to have_text('Rspec sucks')
  end
end

feature "User visits a subreddit" do
  before do
    @user = User.create!(email: "emily.owaki@gmail.com", cohort: "wolves", password: "catscats")
    @subreddit = Subreddit.create!(name: "yellow", moderator: @user, description: "blue")
    @post = Post.create!(title: "colors", body: "let's talk about them",
                 author: @user,
                 subreddit: @subreddit)
    @comment = Comment.create!(body: "I think colors are stupid", author: User.first, post: @post)
  end

  scenario "sees a list of posts and can view them without logging in" do
    visit subreddit_path(@subreddit)
    expect(page).to have_text("color")
  end

  scenario "user can visit a post on a subreddit" do
    visit subreddit_path(@subreddit)
    click_on "colors"
    expect(page).to have_text("let's talk about them")
  end

  scenario "user can view a comment" do
    visit subreddit_post_path(@subreddit, @post)
    expect(page).to have_text("I think colors are stupid")
  end
end

feature "User can leave feedback on a post" do
  before do
    @user = User.create!(email: "emily.owaki@gmail.com", cohort: "wolves", password: "catscats")
    @subreddit = Subreddit.create!(name: "yellow", moderator: @user, description: "blue")
    @subscription = Subscription.create!(subreddit: @subreddit, user: @user)
    @post = Post.create!(title: "colors", body: "let's talk about them",
                 author: @user,
                 subreddit: @subreddit)
    @comment = Comment.create!(body: "I think colors are stupid", author: @user, post: @post)
  end

  scenario "User must login to view the comment form" do
    visit subreddit_post_path(@subreddit, @post)
    expect(page).to_not have_text("Leave a comment")
  end

  scenario "User can see leave a comment link" do
    visit subreddit_post_path(@subreddit, @post)
    fill_in 'email', :with => 'emily.owaki@gmail.com'
    fill_in 'password', :with => 'catscats'
    click_on 'Login'
    click_on @subreddit.name.upcase
    click_on @post.title
    # click_on "Leave a comment"
    expect(page).to have_content("Leave a comment")
  end

  scenario "User can click leave a comment" do
    visit subreddit_post_path(@subreddit, @post)
    fill_in 'email', :with => 'emily.owaki@gmail.com'
    fill_in 'password', :with => 'catscats'
    click_on 'Login'
    click_on @subreddit.name.upcase
    click_on @post.title
    click_on 'Leave a comment'
  end

  scenario "User can leave a comment" do
    ###this test should pass after the bug is fixed
    visit new_subreddit_post_comment_path(@subreddit, @post)
    fill_in 'email', :with => 'emily.owaki@gmail.com'
    fill_in 'password', :with => 'catscats'
    click_on 'Login'
    click_on @subreddit.name.upcase
    click_on @post.title
    fill_in 'leave your comment here', :with => 'Cats?'
    click_on 'Create Comment'
    expect(page).to have_text('Cats?')
  end

  # scenario "User can delete a comment" do
  #   visit '/subreddits/1/posts/1/comments/new'
  #   fill_in 'Body', :with => 'Cats?'
  #   click_on 'Create Comment'
  #   click_on 'Delete'
  #   expect(page).to_not have_text("Cats?")
  # end

  scenario "User can upvote a post" do
    visit subreddit_post_path(@subreddit, @post)
    fill_in 'email', :with => 'emily.owaki@gmail.com'
    fill_in 'password', :with => 'catscats'
    click_on 'Login'
    first('Up Vote').click
    expect(page).to have_text("1")
  end

  scenario "User can downvote a post" do
    visit '/subreddits/1/posts/1'
    click_on 'Down Vote'
    expect(page).to have_text("-1")
  end

  scenario "Upvotes increase by 1 point" do
    visit '/subreddits/1/posts/1'
    click_on 'Up Vote'
    visit '/subreddits/1/posts/1'
    click_on 'Up Vote'
    expect(page).to have_text("2")
  end
end
