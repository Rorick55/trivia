require 'rails_helper'

RSpec.describe Quiz, type: :model do
  it { should have_many :quiz_responses }
  it { should have_many :users }

  it { should validate_presence_of(:trivia_questions) }
end
