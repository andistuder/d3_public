class EnquiriesController < ApplicationController

  def send_enquiry
    FormMailer.enquiry_email(params).deliver rescue redirect_to('/enquiry-form', :alert => "Something went wrong. Please try again or contact us on info@d3technologies.com")
    redirect_to('/enquiry-form', :notice => "Thank you for you interest in d3. One of our team members will get back to shortly.") and return
  end

  def send_subscription
    FormMailer.mailer_email(params).deliver rescue redirect_to('/', :alert => "Something went wrong. Please try again or contact us on info@d3technologies.com")
    render :nothing => true
  end

end
