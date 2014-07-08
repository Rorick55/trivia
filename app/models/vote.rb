class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :trivia_fact

  validates :user
  validates :trivia_fact
end
