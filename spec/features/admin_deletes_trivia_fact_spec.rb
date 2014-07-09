require 'rails_helper'

feature 'admin deletes a trivia fact', %Q(
  As an admin I should be able to delete trivia
  if I know it to be false.
) do

  # I should be able to find a delete button on the index page for trivia.
  # When i press it I should be redirected to the same page with a notification
  # that i deleted thetrivia.
  # If it does not delete I should see a error message.

  scenario 'admin deletes trivia fact' do
    trivia_fact = FactoryGirl.create(:trivia_fact)
    admin = FactoryGirl.create(:user, role: 'admin')
    login_as admin

    visit admin_trivia_facts_path

    click_on 'Delete trivia'

    expect(trivia_fact).to eq nil
  end

  scenario 'user tries to delete trivia fact' do
    user = FactoryGirl.create(:user)
    login_as user

    visit trivia_facts_path

    expect(page).to_not have_content 'Delete trivia'
  end
end
