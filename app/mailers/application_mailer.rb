class ApplicationMailer < ActionMailer::Base
  default from: "info@cshub.ca"
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    #attachments.inline['cshub.png'] = File.read('cshub_cropped.png')
    mail( :to => @user.email,
    :subject => 'Welcome to CS Hub' )
  end
end
