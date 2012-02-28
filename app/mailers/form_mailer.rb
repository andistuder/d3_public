class FormMailer < ActionMailer::Base
  default :from => "d3@cenatus.org"

  def enquiry_email(form_content)
    @form_content = form_content
    #@url  = "http://example.com/login"
    #puts "ANDI#{@form_content[:email]}"
    #TODO change to correct email setting
    #mail(:to => "d3@cenatus.org", :subject => "d3 web enquiry")
    mail(:to => "andi@cenatus.org", :subject => "d3 web enquiry test")
  end

end
