class Favorite < ActiveRecord::Base
  belongs_to :users
  belongs_to :trivia_facts
  validates :user, presence: true
  validates :trivia_fact, presence: true
  validates :user, uniqueness: { scope: :trivia_fact }
end
