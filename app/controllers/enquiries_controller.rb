class EnquiriesController < ApplicationController

  def send_enquiry
    #TODO validate send or raise error, redirect to back?
    FormMailer.enquiry_email(params).deliver
    redirect_to('/', :notice => "Enquiry was successfully sent.")

    #redirect_to honey_path(@honey), :notice => "Thank you for your purchase order! The seller has been notified and will be in touch shortly." and return

  end
end
