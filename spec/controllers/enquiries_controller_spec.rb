require 'spec_helper'

describe EnquiriesController do

  before :each do
    FormMailer.should_receive(:deliver)
  end

  describe "PUT 'send_enquiry'" do
    it "should be successful" do
      put 'send_enquiry'
      response.should be_redirect
    end
  end

end
