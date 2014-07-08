class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :trivia_fact

  validates :user, presence: true
  validates :trivia_fact, presence: true
  validates :user_id, uniqueness: { scope: :trivia_fact_id }
end
