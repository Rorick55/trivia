require 'rails_helper'

feature 'user takes a random quiz', %Q(
  As a user I would like to be able to
  test my trivia knowledge by taking a
  random trivia test.
) do

  # I can visit a page with 10 random trivia questions.
  # I can fill out an answer for each question.
  # I can submit my quiz and see which ones I got right and wrong.

  let!(:trivia_fact) { FactoryGirl.create(:trivia_fact, featured: true, quiz_question: true) }
  let(:user) { FactoryGirl.create(:user) }
  scenario 'user inputs valid answers' do
    login_as user
    visit new_trivia_quiz_path

    fill_in 'Answer', with: 'George'
    click_on 'Submit'

    expect(page).to have_content 'You got'
    expect(page).to have_content 'Successfully completed quiz'
  end

  scenario 'user inputs invalid answers' do
    login_as user
    visit new_trivia_quiz_path

    click_on 'Submit'

    expect(page).to have_content "can't be blank"
  end
end
