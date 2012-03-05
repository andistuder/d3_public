require 'spec_helper'

describe DownloadsController do

  describe "GET show" do
    before :each do
      @download = FactoryGirl.build(:download)
      @download_categories = [FactoryGirl.build(:download_category)]
      #@download_categories = [FactoryGirl.build(:download_category)]
      Download.should_receive(:find).and_return(@download)
      DownloadCategory.should_receive(:all).and_return(@download_categories)
    end

    it "should be successful" do
      get 'show', :id => 1
      response.should be_success
    end

    it "assigns @download" do
      get 'show', :id => 1
      assigns(:download).should eq(@download)
    end

    it "assigns @download_categories" do
      get 'show', :id => 1
      assigns(:download_categories).should eq(@download_categories)
    end
  end

end
