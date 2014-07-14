class QuizResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz
  validates :answer1, presence: true
  validates :answer2, presence: true
  validates :answer3, presence: true
  validates :answer4, presence: true
  validates :answer5, presence: true
  validates :answer6, presence: true
  validates :answer7, presence: true
  validates :answer8, presence: true
  validates :answer9, presence: true
  validates :answer10, presence: true
  validates :user, presence: true
  validates :quiz, presence: true
  validates :user_id, uniqueness: { scope: :quiz_id }
end
