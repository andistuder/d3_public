require 'spec_helper'

describe DownloadCategoriesController do

  before :each do
    @parents = []
    @test_categories = []

    30.times do |i|
      @parents << FactoryGirl.build(:download, :name => "name#{i}", :created_at => Time.now - (1000 * i))
    end

    3.times do |i|
      @test_categories << FactoryGirl.build(:download_category, :name => "cat_name#{i}", :created_at => Time.now - (1000 * i))
    end
  end

  describe "GET index" do

    before :each do
      @expected_range = @parents[0..1]
      Download.should_receive(:find_latest).and_return(@expected_range)
      DownloadCategory.should_receive(:all).and_return(@test_categories)
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns collection" do
      get :index
      assigns(:downloads).should eq(@expected_range)
    end

    it "assigns all categories" do
      get :index
      assigns(:download_categories).should eq(@test_categories)
    end
  end


  describe "GET show" do

    before :each do
      DownloadCategory.should_receive(:find).and_return(@test_categories[1])
      DownloadCategory.should_receive(:all).and_return(@test_categories)
    end

    it "should be successful" do
      get 'show', :id => 1
      response.should be_success
    end

    it "assigns @download_category" do
      get 'show', :id => 1
      assigns(:download_category).should eq(@test_categories[1])
    end

    it "assigns all categories" do
      get 'show', :id => 1
      assigns(:download_categories).should eq(@test_categories)
    end

  end

  #describe "GET news/next/page" do
  #
  #  describe "with more records" do
  #
  #    before :each do
  #      @expected_range = @parents[2..21]
  #      Download.should_receive(:find_next).and_return(@expected_range)
  #    end
  #
  #    it "should be successful" do
  #      get 'next', :cat => 1
  #      response.should be_success
  #    end
  #
  #    it "assigns @downloads for the first page" do
  #      get 'next', :page => 1, :cat => 1
  #      assigns(:downloads).should eq(@expected_range)
  #    end
  #  end
  #
  #
  #  describe "no more records" do
  #    before :each do
  #      Download.should_receive(:find_next).and_return([])
  #    end
  #
  #    it "renders nothing with a 204" do
  #      get 'next', :page => 1000, :cat => 1
  #      response.code.should eq("204")
  #      response.body.should eq("")
  #    end
  #  end
  #end
end