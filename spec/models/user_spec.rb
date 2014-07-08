require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :trivia_facts }
  it { should have_many :favorites }
  it { should have_many :votes }

  it { should have_valid(:role).when('user', 'admin') }
  it { should_not have_valid(:role).when(1, nil, '', 'bob') }
end
