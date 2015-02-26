class UserMailer < ApplicationMailer
  default from: "welcome@twitterclone.com" 
 
  def signup_confirmation(user)
    @user = user #this specifies who to send email to. We set the instance variable here to use it in the view

    mail to: user.email, subject: "Welcome to TwitterClone"
  end
end
