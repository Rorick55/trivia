require 'rails_helper'

feature 'user creates a new trivia fact', %Q(
  As a user I want to be able to create a new
  trivia fact, so that I can contribute to
  the site.
) do

  # I should be able to go to a page with a form to add a new trivia fact
  # I should be able to fill out the form and be redirected to the
  #   trivia facts information page
  # I should be given an error if the fact already exsists or if I do not
  #   fill out the form completely.
  # I should be given a confirmation message if the trivia is saved
  let!(:category) { FactoryGirl.create(:category)}
  scenario 'user inputs valid information' do
    visit new_trivia_fact_path

    fill_in 'Question', with: 'What is the only species of deer where
      both the male and female have antlers?'
    fill_in 'Answer', with: 'Reindeer'
    select category.name, from: 'Category'
    click_on 'Submit'

    expect(page).to have_content 'Successfully added new trivia!'
    expect(page).to have_content 'What is the only species of deer where
      both the male and female have antlers?'
    expect(page).to have_content 'Reindeer'
  end

  scenario 'user inputs invalid information' do
    visit new_trivia_fact_path

    click_on 'Submit'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content 'Successfully'
  end

  scenario 'user inputs duplicate information' do
    trivia = FactoryGirl.create(:trivia_fact, category: category)

    visit new_trivia_fact_path

    fill_in 'Question', with: trivia.question
    fill_in 'Answer', with: trivia.answer
    select category.name, from: 'Category'
    click_on 'Submit'

    expect(page).to have_content 'has already been taken'
    expect(page).to_not have_content 'Successfully'
  end
end
