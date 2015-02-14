class AddAttachmentImageToScorecards < ActiveRecord::Migration
  def self.up
    change_table :scorecards do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :scorecards, :image
  end
end
