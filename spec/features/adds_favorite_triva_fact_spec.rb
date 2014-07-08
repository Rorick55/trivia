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

  scenario 'user adds a favorite trivia fact' do
    user = FactoryGirl.create(:user)
    trivia_fact = FactoryGirl.create(:trivia_fact)

    visit trivia_facts_path
    click_on 'Favorite'

    visit user_path(user)

    expect(page).to have_content trivia_fact.question
    expect(page).to have_content trivia_fact.answer
  end
end
