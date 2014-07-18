class QuizResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz
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
    when 11
      answer11
    when 12
      answer12
    else
      false
    end
  end

  def total
    total = []
    answer_num = 1
    quiz.trivia_questions.each do |question|
      if TriviaFact.find(question).answer.downcase == answer_col(answer_num).downcase
        total << 1
      end
      answer_num += 1
    end
    total.length
  end
end
