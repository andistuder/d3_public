class EnquiriesController < ApplicationController

  def send_enquiry
    #TODO validate send or raise error, below does not pick up delivery error. redirect to back?
    if FormMailer.enquiry_email(params).deliver
      redirect_to('/', :notice => "Enquiry was successfully sent.")
    else
      redirect_to(:back, :notice => "Something went wrong. Please try again or contact us on info@d3technologies.com")
    end
    #redirect_to honey_path(@honey), :notice => "Thank you for your purchase order! The seller has been notified and will be in touch shortly." and return
  end
end
