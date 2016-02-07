class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 	has_many :scorecards, dependent: :destroy

 	validates :name, presence: true

 	after_create :send_notification
 	def send_notification
 		AdminMailer.new_user(self).deliver
 	end

 	# has_attached_file :avatar, dependent: :destroy, :styles => { :medium => "300x300>", :small => "100x100>", :thumb => "50x50" }, :default_url => "/images/:style/missing.jpg"
 	# validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

 	attr_accessor :remove_avatar

 	before_save :delete_avatar, if: ->{ remove_avatar == '1' && !avatar_updated_at_changed? }

 	private

 	def delete_avatar
 		self.avatar = nil
 	end
end
