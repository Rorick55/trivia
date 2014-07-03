require 'rails_helper'

feature 'user views a trivia facts information page', %Q{
  As a user I want to be able to go to a
  trivia facts information page.
} do

  # I should be able to navigate to a trivia facts show page.
  # I should see the question, answer, and creater.

  scenario 'user views trivia information page' do
    trivia_fact = FactoryGirl(:trivia_fact)

    visit trivia_fact_path(trivia_fact)

    expect(page).to have_content trivia_fact.answer
    expect(page).to have_content trivia_fact.question
    expect(page).to have_content trivia_fact.category
    expect(page).to have_content trivia_fact.user.username
  end
end

