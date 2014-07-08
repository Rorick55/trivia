class AddIndexToTriviaFacts < ActiveRecord::Migration
  def change
    add_index :trivia_facts, :question, unique: true
  end
end
