class PasswordNotification < ActionMailer::Base

  def password(user,password)
     @recipients = user.email
     # @from = '"Florida Bible Study" <info@floridabiblestudy.org>'
     @from = 'info@floridabiblestudy.org'
     #@bcc = 'info@floridabiblestudy.org'
     @sent_on = Time.now
     @subject = 'Your floridabiblestudy.org password has been reset'
     @headers = {}
     @body = "Someone, possibly you, requested a password reset \n" +
             "for your account at the floridabiblestudy.org.\n\n" +
             "Your new password is #{password}\n\n" +
             "Logon here: \n" +
             url_for(:host => "www.floridabiblestudy.org", :controller => "login", :action => "login") + "\n"
  end

end
