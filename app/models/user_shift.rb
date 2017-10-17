class UserShift < ApplicationRecord
  belongs_to :user
  belongs_to :shift
  after_create :send_mail

private 
	def send_mail
		UserShiftMailer.new_usershift(self).deliver_later
	end
end
