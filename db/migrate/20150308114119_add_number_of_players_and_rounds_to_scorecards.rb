class AddNumberOfPlayersAndRoundsToScorecards < ActiveRecord::Migration
  def change
    add_column :scorecards, :number_of_players, :integer
    add_column :scorecards, :rounds, :integer
  end
end
