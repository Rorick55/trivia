class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
      t.integer :user_id, null: false
      t.integer :trivia_fact_id, null: false
      t.integer :vote, default: 0

      t.timestamps
    end
  end
end
