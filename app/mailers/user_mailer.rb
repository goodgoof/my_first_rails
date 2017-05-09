class UserMailer < ApplicationMailer
	default from: "anjalidsharma8@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'anjalidsharma8@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  # send Welcome Email once user confirms the account
  def welcome_email(user)
  	@user = user
  	mail (to: 2user.email, subject: "Welcome to Hello-Bikes! We promise you fun times with Hello-Bikes.")
  end
end
