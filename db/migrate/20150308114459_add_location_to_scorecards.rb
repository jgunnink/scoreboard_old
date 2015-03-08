class AddLocationToScorecards < ActiveRecord::Migration
  def change
    add_column :scorecards, :location, :string
  end
end
