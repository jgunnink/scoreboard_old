class Contact < MailForm::Base
	attribute :name,			validate: true
	attribute :email,			validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message
	attribute :nickname,	captcha: true

	# Declare the email headers. It accepts anything the mail method in ActionMailer accepts.
	def headers
		{
			subject: "My Contact Form",
			to: "jgunnink@gmail.com",
			from: %("#{name}" <#{email}>)
		}
	end
end