class AddUserIdToScorecards < ActiveRecord::Migration
  def change
    add_column :scorecards, :user_id, :integer
    add_index :scorecards, :user_id
  end
end
