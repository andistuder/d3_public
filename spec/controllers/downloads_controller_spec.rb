require 'spec_helper'

describe DownloadsController do

  describe "GET show" do
    before :each do
      @download = FactoryGirl.build(:download)
      Download.should_receive(:find).and_return(@download)
    end

    it "should be successful" do
      get 'show', :id => 1
      response.should be_success
    end

    it "assigns @download" do
      get 'show', :id => 1
      assigns(:download).should eq(@download)
    end
  end

end
