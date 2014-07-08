require 'rails_helper'

RSpec.describe Favorite, type: :model do
  it { should belong_to :user }
  it { should belong_to :trivia_fact }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:trivia_fact) }

  it { should validate_uniqueness_of(:user_id).scoped_to(:trivia_fact_id) }
end
