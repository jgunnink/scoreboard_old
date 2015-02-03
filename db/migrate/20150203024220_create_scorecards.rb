class CreateScorecards < ActiveRecord::Migration
  def change
    create_table :scorecards do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
