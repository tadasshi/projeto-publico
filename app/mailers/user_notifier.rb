class UserNotifier < ApplicationMailer
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(email)

    @email = email

    mail( :to => 'tadasshi@gmail.com',
          :subject => 'Mastering PNL - Contato' )
  end

end
