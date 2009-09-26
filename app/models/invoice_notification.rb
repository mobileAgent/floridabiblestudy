class InvoiceNotification < ActionMailer::Base

  def invoice(user,registration)
     @recipients = user.email
     @from = 'info@floridabiblestudy.org'
     @bcc = 'info@floridabiblestudy.org'
     @sent_on = Time.now
     @subject = 'Your invoice for Florida Mens Bible Study 2010'
     @headers = {}
     @body = make_invoice_text(user,registration)
  end

  private

  def make_invoice_text (user,registration)

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
     p2 += "You can make your check payable to Mike Flester\n"
     p2 += "And mail it to \n\n"
     p2 += "                 Florida Mens Bible Study c/o Mike Flester\n"
     p2 += "                 7113 Deer Valley Road\n"
     p2 += "                 Highland, MD 20777 USA\n"

     p3 = "Thank you for registering for the 2010 Study,\n"
     p3 += "we are looking forward to seeing you there.!\n"
     p3 += "Please contact info@floridabiblestudy.org if you have any questions!\n"

     p4 = "You can change your registration details at the\n"
     p4 += "website using your email address and password to login.\n"
     p4 += url_for(:host => "www.floridabiblestudy.org", :controller => "welcome", :action => "index")
      p4 += "\n"
p
     "#{p1}\n#{p2}\n#{p3}\n#{p4}\n"
  end
end
