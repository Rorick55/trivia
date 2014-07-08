class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :trivia_fact
  validates :user_id, uniqueness: { scope: :trivia_fact_id }
  validates :user, presence: true
  validates :trivia_fact, presence: true
end
