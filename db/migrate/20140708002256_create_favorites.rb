class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id, null: false
      t.integer :trivia_fact_id, null: false

      t.timestamps
    end
    add_index :favorites, [:user_id, :trivia_fact_id], unique: true
  end
end
