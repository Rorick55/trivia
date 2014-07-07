require 'rails_helper'

feature 'user votes on trivia fact', %Q(
  As a user I want to be able to upvote or downvote a trivia fact,
  so that I can help mediate trivia that are not true.
) do

  # I can find two buttons on a trivia information page.
  # I can press false if I know it is false and true if I know it is true.
  # My vote should be tallied and displayed on the page.

  let!(:trivia) { FactoryGirl.create(:trivia_fact) }
  let(:user) { FactoryGirl.create(:user) }
  scenario 'user upvotes a trivia fact' do
    login_as user
    rank = trivia.rank

    visit trivia_fact_path(trivia)

    click_on 'True'

    expect(trivia.total_votes).to eq rank + 1
  end

  scenario 'user downvotes a trivia fact' do
    login_as user
    rank = trivia.rank

    visit trivia_fact_path(trivia)

    click_on 'False'

    expect(trivia.total_votes).to eq rank - 1
  end
end
