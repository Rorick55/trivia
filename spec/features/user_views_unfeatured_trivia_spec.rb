require 'rails_helper'

feature 'user views a list of unfeatured trivia', %Q(
  As a user I want to be able to see a list of all the trivia
  that other people have made and have not been confirmed as
  true or false yet.
) do

  # I can visit a page with all the unfeatured trivia
  # I can see their question and answer
  # I have the ability to say its true or false

  scenario 'user views a list of unfeatured trivia facts' do
    user = FactoryGirl.create(:user)
    trivia_facts = FactoryGirl.create_list(:trivia_fact, 3)
    login_as user

    visit unfeatured_trivia_facts_path

    trivia_facts.each do |trivia|
      expect(page).to have_content trivia.question
      expect(page).to have_content trivia.answer
    end
  end
end
