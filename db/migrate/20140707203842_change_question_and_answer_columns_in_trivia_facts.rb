class ChangeQuestionAndAnswerColumnsInTriviaFacts < ActiveRecord::Migration
  def up
    change_column :trivia_facts, :question, :text, null: false
    change_column :trivia_facts, :answer, :text, null: false
  end

  def down
    change_column :trivia_facts, :question, :string, limit: 2000, null: false
    change_column :trivia_facts, :answer, :string, limit: 2000, null: false
  end
end
