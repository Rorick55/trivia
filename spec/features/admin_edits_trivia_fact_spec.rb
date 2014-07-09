require 'rails_helper'

feature 'admin edits trivia fact', %Q(
  As an admin I can visit a trivia's
  show page and edit the content
  so that I can mediate sub par content.
) do

  # The show page should have an edit button so that I may
  # change the content.
  # If the admin fills in the page correctly they should be
  # redirected to the trivia's show page.
  # if the admin fills in the page with invalid information
  # they should be given an error message.
  let(:trivia_fact) { FactoryGirl.create(:trivia_fact) }
  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  scenario 'admin edits trivia fact with valid input' do
    login_as admin

    visit admin_trivia_fact_path(trivia_fact)

    click_on 'Edit trivia'

    fill_in 'Question', with: 'What is the meaning of life?'
    click_on 'Update'

    expect(page).to have_content 'Successfully updated trivia fact!'
    expect(page).to have_content 'What is the meaning of life?'
  end

  scenario 'admin edits trivia fact with invalid input' do
    login_as admin

    visit admin_trivia_fact_path(trivia_fact)

    click_on 'Edit trivia'

    fill_in 'Question', with: ''
    click_on 'Update'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content 'Successfully updated trivia fact!'
  end

  scenario 'user tries to edit a fact they did not make' do
    user = FactoryGirl.create(:user)
    login_as user

    visit trivia_fact_path(trivia_fact)

    expect(page).to_not have_content 'Edit trivia'
  end
end
