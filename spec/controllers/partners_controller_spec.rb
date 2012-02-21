require 'spec_helper'

describe PartnersController do

  describe "GET show" do

    before :each do
      @test_partner = FactoryGirl.build :partner
      Partner.should_receive(:find).and_return(@test_partner)
    end

    it "should be successful" do
      get 'show', :id => 1
      response.should be_success
    end

    it "assigns @partner" do
      get 'show', :id => 1
      assigns(:partner).should eq(@test_partner)
    end
  end

end
