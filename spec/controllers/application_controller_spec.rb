require 'spec_helper'

describe ApplicationController do

  controller do
    def index
      render :text => "I'm just a stub";
    end
  end

  describe "instance variables" do
    before :each do
      # Asset.stub!(:find).and_return(mock_model(Asset))
      # Asset.stub!(:find).and_return(mock_model(Asset))
    end
    
    it "assigns @og_title" do
      get 'index'
      assigns(:og_title).should_not be_nil
      assigns(:og_title).should eq(D3::Application::SITE_NAME)
    end

    it "assigns @og_type" do
      get 'index'
      assigns(:og_type).should_not be_nil
      assigns(:og_type).should eq("website")
    end

    it "assigns @og_url" do
      get 'index'
      assigns(:og_url).should_not be_nil
      assigns(:og_url).should eq("http://test.host/anonymous")
    end

    it "assigns @og_image" do
      get 'index'
      assigns(:og_image).should_not be_nil
      assigns(:og_image).should eq(D3::Application::SITE_LOGO)
    end

    it "assigns @og_site_name" do
      get 'index'
      assigns(:og_site_name).should_not be_nil
      assigns(:og_site_name).should eq(D3::Application::SITE_NAME)
    end

    it "assigns @og_admins" do
      get 'index'
      assigns(:og_admins).should_not be_nil
      assigns(:og_admins).should eq(D3::Application::FB_ADMIN)
    end

    it "assigns @releated_boxes" do
      get 'index'
      assigns(:related_boxes).should_not be_nil
    end

    it "assigns @news_items" do
      @category = FactoryGirl.build(:category, :name => "General")
      @parents = []

      30.times do |i|
        @parents << FactoryGirl.build(:news_item, :headline => "headline#{i}", :created_at => Time.now - (1000 * i), :categories => [@category])
      end

      @expected_range = @parents[0..1]
      NewsItem.should_receive(:find_latest).and_return(@expected_range)

      get :index
      assigns(:news_items).should eq(@expected_range)
    end

    it "assigns @project_categories" do
      pending

    end

    it "assigns @consulting_areas" do
      pending
    end

    #it "assigns @tweets" do
    #
    #  #require "twitter"
    #
    #  get 'index'
    #
    #  Rails.cache.clear
    #  Rails.cache.stub(:read).with(anything()).and_return(nil)
    #  #TODO unable to stub the API??
    #  #Twitter.stub(:user_timeline).with(D3::Application::TWITTER_NAME).and_return(nil)
    #  assigns(:tweets).should_not be_nil
    #end

  end
end
