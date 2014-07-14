class Quiz < ActiveRecord::Base
  has_many :quiz_responses
  has_many :users, though: :quiz_responses
  validates :trivia_questions, presence: true

  def self.random_quiz
    quiz = []
    10.times { quiz << TriviaFact.order('RANDOM()').first }
    self.create(trivia_questions: quiz)
  end
end
