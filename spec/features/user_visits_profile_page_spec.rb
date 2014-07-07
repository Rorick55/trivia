require 'rails_helper'

feature 'user visits their own profile page', %Q(
  As a user I want to be able to visit my profile
  page so that I can see all the trivia I have contributed
  and all the trivia I have liked.
) do

  # I can visit a personal page with my information.
  # The page also has all of my triva facts
  # Both ones I have made and ones I liked.

  scenario 'user views their profile page' do
    user = FactoryGirl.create(:user)
    FactoryGirl.create(:trivia_fact, user: user)
    login_as user

    visit user_path(user)

    expect(page).to have_content user.username
    user.trivia_facts.each do |trivia|
      expect(page).to have_content trivia.question
    end
  end
end

