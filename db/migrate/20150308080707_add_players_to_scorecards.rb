class AddPlayersToScorecards < ActiveRecord::Migration
  def change
    add_column :scorecards, :playername, :string
  end
end
