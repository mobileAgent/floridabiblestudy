class InvoiceNotification < ActionMailer::Base

  def invoice(user,registration,main_event)
    @recipients = user.email
    @from = 'info@floridabiblestudy.org'
    @bcc = 'info@floridabiblestudy.org'
    @sent_on = Time.now
    @subject = "Your invoice for Florida Mens Bible Study #{main_event.year}"
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
     p2 += "Registration Time: #{registration.created_at}\n"

    p2 += "Amount due: $#{registration.amount_owed}.00\n"
    
    if DateTime.now > (main_event.start_date - 10)
      p2 += "The event is too close to pay by mail.\n"
      p2 += "Please bring your cash or check to the study \n"
      p2 += "and give it to Mike Renth. Thanks!\n"
     else
       p2 += "You can make your check payable to *Boulevard Bible Chapel*\n"
       p2 += "And mail it to \n\n"
       p2 += "                 Florida Mens Bible Study c/o Mike Renth\n"
       p2 += "                 2481 SW 99th Way\n"
       p2 += "                 Miramar FL 33025 USA\n"
     end
       
     p3 = "Thank you for registering for the #{main_event.year} Study,\n"
     p3 += "we are looking forward to seeing you there.!\n"
     p3 += "Please contact info@floridabiblestudy.org if you have any questions!\n"

     p4 = "You can change your registration details at the\n"
     p4 += "website using your email address and password to login.\n"
     p4 += url_for(:host => "www.floridabiblestudy.org", :controller => "welcome", :action => "index")
     p4 += "\n"

     "#{p1}\n#{p2}\n#{p3}\n#{p4}\n"
  end
end
