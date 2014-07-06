require 'rails_helper'

feature 'user signs up', %Q(
  As a site visiter, I want to be able to sign
  up so that I can start
  tracking my use of this site.
  ) do

  # I can visit a page with a sign up form
  # If I fill out the form properly I get redirected to my profile page
  # If I fill out the form incorrectly I get an error message.

  scenario 'user inputs valid information' do
    visit new_user_registration_path

    fill_in 'First name', with: 'Hal'
    fill_in 'Last name', with: 'Peterson'
    fill_in 'Username', with: 'Halthedestroyer'
    fill_in 'Email', with: 'halthedestroyer@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'

    click_on 'Sign up'

    expect(page).to have_content "Welcome! You have signed up successfully."
  end

  scenario 'user inputs invalid information' do
    visit new_user_registration_path

    click_on 'Sign up'

    expect(page).to have_content "can't be blank"
  end

  scenario 'user inputs duplicate data' do
    user = FactoryGirl.create(:user)
    visit new_user_registration_path

    fill_in 'First name', with: user.first_name
    fill_in 'Last name', with: user.last_name
    fill_in 'Username', with: user.username
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password

    click_on 'Sign up'

    expect(page).to have_content 'has already been taken'
  end
end
