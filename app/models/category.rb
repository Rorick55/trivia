class Category < ActiveRecord::Base
  has_many :trivia_facts
end
