class Category < ActiveRecord::Base
  has_many :trivia_facts
  validates :name, presence: true, uniqueness: true
end
