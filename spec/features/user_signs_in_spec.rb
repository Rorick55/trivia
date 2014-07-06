require 'rails_helper'

feature 'user signs in', %Q(
  As a user I want to be able to sign in and sign out,
  so that I can avoid people going on my computer and
  messing with my account.
  ) do

  # I can visit a page that has a form for me to sign in with
  # Once signed in I can click a link to sign out.

  let(:user) { FactoryGirl.create(:user) }
  scenario 'user signs out' do
    login_as user

    visit root_path

    click_on 'Sign Out'

    expect(page).to have_content "Signed out successfully."
  end

  scenario 'user signs in correctly' do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_on 'Sign in'

    expect(page).to have_content 'Signed in successfully'
  end

  scenario 'user signs in with missing information' do
    visit new_user_session_path

    click_on 'Sign in'

    expect(page).to have_content "Invalid email or password."
  end

  scenario 'user already logged in' do

    login_as user
    visit new_user_session_path

    expect(page).to have_content "You are already signed in."
  end
end



