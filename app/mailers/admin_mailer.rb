class AdminMailer < ActionMailer::Base
	default from: "Scoreboard Admin <no-reply@scoreboard.website>"
	default to: "jgunnink@gmail.com"

	def new_user(user)
		@user = user
		mail(subject: "New Scoreboard User: #{user.email}")
	end
	
end
