class ContactMailer < ActionMailer::Base
	default to: "info@lynda.com"
	
	def contact_email(name, email, message)
		@name = name
		@email = email
		@message = message
		
		mail(from: email, subject: 'Lynda.com Contact Form Message')
	end
end