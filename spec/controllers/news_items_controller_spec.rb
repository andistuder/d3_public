require 'spec_helper'

describe NewsItemsController do

  before :each do
    @news_item = FactoryGirl.build :news_item
    @news_item2 = FactoryGirl.build :news_item

  end

  describe "GET index" do

    before :each do
      NewsItem.should_receive(:find_newest_two).and_return([@news_item, @news_item2])
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns collection" do
      get :index
      assigns(:news_items).should eq([@news_item, @news_item2])
    end
  end


  describe "GET show" do

    before :each do
      NewsItem.should_receive(:find).and_return(@news_item2)
    end

    it "should be successful" do
      get 'show', :id => 1
      response.should be_success
    end

    it "assigns @news_item" do
      get 'show', :id => 1
      assigns(:news_item).should eq(@news_item2)
    end
  end
end
