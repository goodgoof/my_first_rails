class UserMailer < ApplicationMailer
	default from: "anjalidsharma8@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'anjalidsharma8@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  # send Welcome Email once user confirms the account
  def welcome(user)
  @appname = "Hello-Bikes"
  mail( :to => user.email,
        :subject => "Welcome to #{@appname}!")
  end
  
end
