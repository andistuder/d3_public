require 'spec_helper'

describe EnquiriesController do

  before :each do
    #TODO could be tighter
    #FormMailer.should_receive(:enquiry_email)
  end

  describe "PUT 'send_enquiry'" do
    it "should be successful" do
      put 'send_enquiry'
      response.should be_redirect
    end
  end

  describe "PUT 'send_subscription'" do
    it "should be successful" do
      put 'send_subscription'
      response.should be_success
    end
  end

end
