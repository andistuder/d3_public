require 'spec_helper'

describe EnquiriesController do

  describe "PUT 'send_enquiry'" do
    it "should be successful" do
      put 'send_enquiry'
      #TODO text if method is called
      #ActionMailer::Base.enquiry_email.should_receive(:deliver)
      response.should be_redirect
    end
  end

end
