class FormMailer < ActionMailer::Base
  default :from => "webmailer@cenatus.org"

  def enquiry_email(form_content)
    @form_content = form_content
    mail(:to => "enquiries@d3technologies.com", :subject => "d3 web enquiry")
  end

  def mailer_email(form_content)
    @form_content = form_content
    mail(:to => "mailinglist@d3technologies.com", :subject => "mailing list subscription")
  end
end
