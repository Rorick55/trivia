require 'rails_helper'

feature 'user views a list of trivia facts', %Q{
  As a user I want to be able to visit a
  page that has a list of trivia facts.
} do

  # I should be able to see a list of all the featured trivia facts.
  # I should be able to see both the question and the answer.

  scenario 'user views list of trivia facts' do
    trivia_facts = FactoryGirl(:trivia_fact, 3)

    visit trivia_facts_path

    trivia_facts.each do |trivia|
      expect(page).to have_content trivia.question
      expect(page).to have_content trivia.answer
    end
  end
end
