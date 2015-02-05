class UserMailer < ApplicationMailer
	default from: "ovrride@example.com"

	def entry_created(project)
		@project= project
		mail(to: "marc@urban4m.com", subject: "New entry created in project #{@project.name}")
	end
end
