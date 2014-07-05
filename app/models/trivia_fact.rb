class TriviaFact < ActiveRecord::Base
  belongs_to :category
  validates :question, presence: true, uniqueness: true
  validates :answer, presence: true
  validates :category, presence: true
end
