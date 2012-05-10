class FormMailer < ActionMailer::Base
  # default :from => "webmailer@cenatus.org"

  def enquiry_email(form_content)
    @form_content = form_content
    mail(:to => "enquiries@d3technologies.com", :from => @form_content[:email], :subject => "d3 web enquiry from #{@form_content[:first_name]} #{@form_content[:last_name]}")
  end

  def mailer_email(form_content)
    @form_content = form_content
    mail(:to => "mailinglist@d3technologies.com", :from => "webmailer@cenatus.org", :subject => "mailing list subscription")
  end
end
