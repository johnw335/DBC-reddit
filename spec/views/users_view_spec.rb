require 'rails_helper'


feature "user sessions" do
  before do
    User.create!(email: "test@gmail.com", username: "test", cohort: "Wolves", password: "catscats")
  end
  scenario "user can log in" do
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'test@gmail.com'
    fill_in 'Password', :with => 'catscats'
    click_on 'Login'
    expect(page).to have_text('Logout')
  end

  scenario "user can't log in without signing up" do
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'nate@dbc.com'
    fill_in 'Password', :with => 'catscatscats'
    click_on  'Login'
    expect(page).to have_text('Invalid email or password Email Password')
  end

  scenario "user can sign up" do
    visit '/'
    click_on 'Signup'
    fill_in 'Email', :with => 'cat@gmail.com'
    fill_in 'Username', :with => 'cat'
    fill_in 'Cohort', :with => 'cats 2015'
    fill_in 'Password', :with => 'iamacat'
    click_on 'Sign Up'
    expect(page).to have_text('Logout')
  end
end
