require 'rails_helper'

RSpec.describe QuizResponse, type: :model do
  it { should belong_to :user }
  it { should belong_to :quiz }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:quiz) }

  it { should validate_uniqueness_of(:user_id).scoped_to(:quiz_id) }

  describe 'answer_col' do
    it 'helps call column based on number' do
      quiz_response = FactoryGirl.create(:quiz_response)
      expect(quiz_response.answer_col(5)).to eq quiz_response.answer5
      expect(quiz_response.answer_col(24)).to eq false
    end
  end
end
