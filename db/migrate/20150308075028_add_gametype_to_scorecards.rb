class AddGametypeToScorecards < ActiveRecord::Migration
  def change
    add_column :scorecards, :gametype, :string
  end
end
