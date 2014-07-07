class RenameVotingsToVotes < ActiveRecord::Migration
  def up
    rename_table :votings, :votes
  end

  def down
    rename_table :votes, :votings
  end
end
