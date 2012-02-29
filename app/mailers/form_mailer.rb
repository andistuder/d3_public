class FormMailer < ActionMailer::Base
  #TODOenter custom email?
  default :from => "webmailer@cenatus.org"

  def enquiry_email(form_content)
    @form_content = form_content
    #TODO enter right email
    #mail(:to => "enquiries@d3technologies.com", :subject => "d3 web enquiry")
    mail(:to => "andi@cenatus.org", :subject => "d3 web enquiry")
  end

end
