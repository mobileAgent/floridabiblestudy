class WaitlistNotification < ActionMailer::Base

  def invoice(user,registration,main_event)
     @recipients = user.email
     @from = 'Florida Bible Study <info@floridabiblestudy.org>'
     @bcc = 'info@floridabiblestudy.org'
     @sent_on = Time.now
     @subject = "Florida Mens Bible Study #{main_event.year} Waiting List"
     @headers = {}
     @body = make_invoice_text(user,registration,main_event)
  end

  private

  def make_invoice_text (user,registration,main_event)

     p1 = "#{registration.first_name} #{registration.middle_name} #{registration.last_name}\n"
     p1 += "#{registration.address1}\n"
     if ! registration.address2.nil? && registration.address2.length > 0
        p1 += "#{registration.address2}\n"
     end
     p1 += "#{registration.city} #{registration.state} #{registration.zip_code}\n"

     p2 =  "Phone:  #{registration.phone}\n"
     p2 += "Travel Phone: #{registration.mobile}\n"

    p3 = "Thank you for your interest in the #{main_event.year} Florida Mens Bible Study,\n"
     p3 += "You have been added to the waiting list and we will contact you\n"
     p3 += "if more slots become available.\n"
     p3 += "Please contact info@floridabiblestudy.org if you have any questions!\n"

     p4 = "You can update your waiting list registration details at the \n"
     p4 += "website using your email address and password to login.\n"
     p4 += url_for(:host => "www.floridabiblestudy.org", :controller => "welcome", :action => "index")
      p4 += "\n"

     "#{p1}\n#{p2}\n#{p3}\n#{p4}\n"
  end
end
