class AddQuizQuestionToTriviaFacts < ActiveRecord::Migration
  def change
    add_column :trivia_facts, :quiz_question, :boolean, default: false
  end
end
