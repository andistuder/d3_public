require 'spec_helper'

describe NewsItemsController do

  before :each do
    @category = FactoryGirl.build(:category, :name => "General")
    @parents = []

    30.times do |i|
      @parents << FactoryGirl.build(:news_item, :headline => "headline#{i}", :created_at => Time.now - (1000 * i), :categories => [@category])
    end
  end

  describe "GET index" do

    #moved to application controller test
    #before :each do
    #  @expected_range = @parents[0..1]
    #  NewsItem.should_receive(:find_latest).and_return(@expected_range)
    #end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    #moved to application controller test
    #it "assigns collection" do
    #  get :index
    #  assigns(:news_items).should eq(@expected_range)
    #end
  end

  describe "GET announcements" do
    before :each do
      @category_p = FactoryGirl.build(:category, :name => "Product updates")
      @parents = []
      30.times do |i|
        @parents << FactoryGirl.build(:news_item, :headline => "headline#{i}", :created_at => Time.now - (1000 * i), :categories => [@category_p])
      end
      @expected_range = @parents[0..9]
      NewsItem.should_receive(:find_latest_product_updates).and_return(@expected_range)
    end

    it "should be successful" do
      get :announcements
      response.should be_success
    end
    it "assigns collection" do
      get :announcements
      assigns(:news_items).should eq(@expected_range)
    end
  end


  describe "GET show" do

    before :each do
      NewsItem.should_receive(:find).and_return(@parents[1])
    end

    it "should be successful" do
      get 'show', :id => 1
      response.should be_success
    end

    it "assigns @news_item" do
      get 'show', :id => 1
      assigns(:news_item).should eq(@parents[1])
    end
  end

  describe "GET news/next/page" do

    describe "with more records" do

      before :each do
        @expected_range = @parents[2..21]
        NewsItem.should_receive(:find_next).and_return(@expected_range)
      end

      it "should be successful" do
        get 'next'
        response.should be_success
      end

      it "assigns @news_items for the first page" do
        get 'next', :page => 1
        assigns(:news_items).should eq(@expected_range)
      end
    end


    describe "no more records" do
      before :each do
        NewsItem.should_receive(:find_next).and_return([])
      end

      it "renders nothing with a 204" do
        get 'next', :page => 1000
        response.code.should eq("204")
        response.body.should eq("")
      end
    end

  end

  describe "GET news/next/page" do
    pending "necessary - or equal to GET news/next/page"
  end
end
