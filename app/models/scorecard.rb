class Scorecard < ActiveRecord::Base
	belongs_to :user
  validates :description, presence: true
  validates :number_of_players, numericality: { only_integer: true }, presence: true
  validates :gametype, presence: true
end
