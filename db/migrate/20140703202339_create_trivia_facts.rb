class CreateTriviaFacts < ActiveRecord::Migration
  def change
    create_table :trivia_facts do |t|
      t.string :question, null: false, limit: 2000
      t.string :answer, null: false, limit: 2000
      t.integer :category_id, null: false
      t.integer :rank, default: 0
      t.boolean :featured, default: false

      t.timestamps
    end
  end
end
