require 'mail'

class ApplicationMailer < ActionMailer::Base


  address = Mail::Address.new("admin@thaimeditationcenter.com") # ex: "john@example.com"
  address.display_name = "Thaimeditationcenter".dup # ex: "John Doe"
# Set the From or Reply-To header to the following:
  address.format # returns "John Doe <john@example.com>"

  default from: address

  layout 'mailer'

end
