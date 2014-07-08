require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many :trivia_facts }

  it { should have_valid(:name).when('History', 'Math') }
  it { should_not have_valid(:name).when('', nil) }

  it { should validate_uniqueness_of(:name) }
end
