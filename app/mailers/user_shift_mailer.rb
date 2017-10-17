class UserShiftMailer < ApplicationMailer
	def new_usershift(usershift)
		@usershift = usershift
		@shift = Shift.find(@usershift.shift_id)
		@activity = Activity.find(@shift.activity_id)
		@user=User.find(@usershift.user_id)
		mail(to: @user.email, subject: "Confirmacion de reserva de turno")
	end
end
