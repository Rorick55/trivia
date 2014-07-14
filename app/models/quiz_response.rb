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

  def answer_col(num)
    case num
    when 1
      answer1
    when 2
      answer2
    when 3
      answer3
    when 4
      answer4
    when 5
      answer5
    when 6
      answer6
    when 7
      answer7
    when 8
      answer8
    when 9
      answer9
    when 10
      answer10
    else
      false
    end
  end

  def total
    total = []
    answer_num = 1
    self.quiz.trivia_questions.each do |question|
      if TriviaFact.find(question).answer == answer_col(answer_num)
        total << 1
        answer_num += 1
      end
    end
    total.length
  end
end
