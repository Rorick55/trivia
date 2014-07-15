class CreateQuizResponses < ActiveRecord::Migration
  def change
    create_table :quiz_responses do |t|
      t.string :answer1, null: false
      t.string :answer2, null: false
      t.string :answer3, null: false
      t.string :answer4, null: false
      t.string :answer5, null: false
      t.string :answer6, null: false
      t.string :answer7, null: false
      t.string :answer8, null: false
      t.string :answer9, null: false
      t.string :answer10, null: false
      t.string :answer11, null: false
      t.string :answer12, null: false
      t.integer :user_id, null: false
      t.integer :quiz_id, null: false

      t.timestamps
    end
    add_index :quiz_responses, [:user_id, :quiz_id], unique: true
  end
end
