class Quiz < ActiveRecord::Base
  has_many :quiz_responses
  has_many :users, through: :quiz_responses
  validates :trivia_questions, presence: true

  def self.random_quiz
    quiz = []
    trivia_facts = TriviaFact.where(quiz_question: true).order('RANDOM()').limit(10)
    trivia_facts.each do |question|
      quiz << question.id
    end
    create(trivia_questions: quiz)
  end
end
