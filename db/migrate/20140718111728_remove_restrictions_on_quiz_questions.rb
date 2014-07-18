class RemoveRestrictionsOnQuizQuestions < ActiveRecord::Migration
  def up
    change_column :quiz_responses, :answer1, :string, null: true
    change_column :quiz_responses, :answer2, :string, null: true
    change_column :quiz_responses, :answer3, :string, null: true
    change_column :quiz_responses, :answer4, :string, null: true
    change_column :quiz_responses, :answer5, :string, null: true
    change_column :quiz_responses, :answer6, :string, null: true
    change_column :quiz_responses, :answer7, :string, null: true
    change_column :quiz_responses, :answer8, :string, null: true
    change_column :quiz_responses, :answer9, :string, null: true
    change_column :quiz_responses, :answer10, :string, null: true
    change_column :quiz_responses, :answer11, :string, null: true
    change_column :quiz_responses, :answer12, :string, null: true
  end

  def down
    change_column :quiz_responses, :answer1, :string, null: false
    change_column :quiz_responses, :answer2, :string, null: false
    change_column :quiz_responses, :answer3, :string, null: false
    change_column :quiz_responses, :answer4, :string, null: false
    change_column :quiz_responses, :answer5, :string, null: false
    change_column :quiz_responses, :answer6, :string, null: false
    change_column :quiz_responses, :answer7, :string, null: false
    change_column :quiz_responses, :answer8, :string, null: false
    change_column :quiz_responses, :answer9, :string, null: false
    change_column :quiz_responses, :answer10, :string, null: false
    change_column :quiz_responses, :answer11, :string, null: false
    change_column :quiz_responses, :answer12, :string, null: false
  end
end
