class EnquiriesController < ApplicationController

  def send_enquiry
    FormMailer.enquiry_email(params).deliver rescue redirect_to(:back, :alert => "Something went wrong. Please try again or contact us on info@d3technologies.com")
    redirect_to('/', :notice => "Enquiry was successfully sent.") and return

  end
end
