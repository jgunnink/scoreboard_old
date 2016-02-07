class Scorecard < ActiveRecord::Base
	belongs_to :user
  validates :description, presence: true
  has_many :players
end
