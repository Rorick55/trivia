class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :trivia_questions, array: true,  null: false

      t.timestamps
    end
  end
end
