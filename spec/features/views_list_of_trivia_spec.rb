require 'rails_helper'

feature 'user views a list of featured trivia facts', %Q(
  As a user I want to be able to visit a
  page that has a list of trivia facts.
) do

  # I should be able to see a list of all the featured trivia facts.
  # I should be able to see both the question and the answer.

  scenario 'user views list of trivia facts' do
    trivia_fact = FactoryGirl.create(:trivia_fact, featured: true)

    visit trivia_facts_path


      expect(page).to have_content trivia_fact.question
      expect(page).to have_content trivia_fact.answer

  end
end
