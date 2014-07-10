require 'rails_helper'

feature 'user adds favorite trivia fact', %Q(
  As a user I want to be able to favorite trivia
  facts so that I can use them or look at them later.
) do

  # I can find favorite buttons in the index page.
  # When I click on a favorite button the triva fact
  # associated with it is added to my favorites
  # I can view a list of my favorite trivia facts
  # on my profile page
  let(:user) { FactoryGirl.create(:user) }
  let(:trivia_fact) { FactoryGirl.create(:trivia_fact) }
  scenario 'user adds a favorite trivia fact' do
    login_as user

    visit trivia_fact_path(trivia_fact)

    click_on 'Favorite'
    expect(page).to have_content 'Trivia favorited!'

    visit user_path(user)
    expect(page).to have_content trivia_fact.question
  end

  scenario 'user tries to favorite a trivia fact twice' do
    login_as user

    visit trivia_fact_path(trivia_fact)

    click_on 'Favorite'
    click_on 'Favorite'
    expect(page).to have_content 'Trivia has already been favorited'
  end

  scenario 'unregistered user tries to favorite trivia fact' do
    visit trivia_fact_path(trivia_fact)

    click_on 'Favorite'
    expect(page).to have_content 'You must be logged in to do that'
  end

end
