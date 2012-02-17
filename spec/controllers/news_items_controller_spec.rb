require 'spec_helper'

describe NewsItemsController do

  before :each do
    @test_news_items = []

    30.times do |i|
      @test_news_items << FactoryGirl.build(:news_item, :headline => "headline#{i}", :created_at => Time.now - (1000 * i))
    end
  end

  describe "GET index" do

    before :each do
      @expected_range = @test_news_items[0..1]
      NewsItem.should_receive(:find_latest).and_return(@expected_range)
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns collection" do
      get :index
      assigns(:news_items).should eq(@expected_range)
    end
  end


  describe "GET show" do

    before :each do
      NewsItem.should_receive(:find).and_return(@test_news_items[1])
    end

    it "should be successful" do
      get 'show', :id => 1
      response.should be_success
    end

    it "assigns @news_item" do
      get 'show', :id => 1
      assigns(:news_item).should eq(@test_news_items[1])
    end
  end

  describe "GET news/next/page" do
    before :each do
      @expected_range = @test_news_items[2..21]
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
end
