require 'rails_helper'

RSpec.describe TriviaFact, type: :model do
  it { should have_many :votes }
  it { should have_many :favorites }
  it { should belong_to :category }
  it { should belong_to :user }

  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:answer) }
  it { should validate_presence_of(:category) }

  it { should validate_uniqueness_of(:question)}

  describe 'total_votes' do
    it 'sums all votes' do
      trivia_fact = FactoryGirl.create(:trivia_fact)
      5.times { FactoryGirl.create(:vote, trivia_fact: trivia_fact, vote: 1)}
      expect(trivia_fact.total_votes).to eq 5
    end
  end

  describe 'update_rank' do
    it 'updates trivia rank' do
      trivia_fact = FactoryGirl.create(:trivia_fact)
      5.times { FactoryGirl.create(:vote, trivia_fact: trivia_fact, vote: 1)}
      trivia_fact.update_rank
      expect(trivia_fact.rank).to eq 5
    end
  end
end
