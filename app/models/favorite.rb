class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :trivia_fact
  validates :user, presence: true
  validates :trivia_fact, presence: true
  validates :user, uniqueness: { scope: :trivia_fact }
end
