require 'rails_helper'

feature 'admin features trivia fact', %Q(
  As an admin I should be able to make trivia featured
  so that they can go to the main page.
) do

  # I should be able to travel to a page with all the unstaged trivia
  # I should be able to press a button and make a trivia fact featured
  let!(:trivia_fact) { FactoryGirl.create(:trivia_fact) }
  scenario 'admin features a trivia fact' do
    admin = FactoryGirl.create(:user, role: 'admin')
    login_as admin

    visit admin_trivia_facts_path

    click_on "Feature"

    expect(trivia_fact.featured).to eq true
  end

  scenario 'user tries to feature a trivia fact' do
    user = FactoryGirl.create(:user)
    login_as user

    visit trivia_facts_path

    expect(page).to_not have_content 'Feature'
  end
end
