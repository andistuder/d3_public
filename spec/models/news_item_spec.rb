require 'spec_helper'

describe NewsItem do
  it "can be instantiated" do
    NewsItem.new.should be_an_instance_of(NewsItem)
  end

  it { should validate_presence_of(:headline) }
  it { should validate_presence_of(:content) }

  it { should have_and_belong_to_many(:assets) }
  it { should have_and_belong_to_many(:categories) }


  describe "database finders" do

    describe "find_latest" do
      before :each do
        @category = FactoryGirl.build(:category, :name => "General")

        @parents = []

        5.times do |i|
          @parents << FactoryGirl.create(:news_item, :headline => "headline#{i}", :created_at => Time.now - (1000 * i), :categories => [@category])
        end
      end
      it "should load 10 records, newest first" do
        NewsItem.find_latest.should eq(@parents[0..9])
      end
    end

    describe "find_latest_product_updates" do
      before :each do
        @category = FactoryGirl.build(:category, :name => "Product updates")

        @parents = []

        5.times do |i|
          @parents << FactoryGirl.create(:news_item, :headline => "headline#{i}", :created_at => Time.now - (1000 * i), :categories => [@category])
        end
      end
      it "should load 10 records, newest first" do
        NewsItem.find_latest_product_updates.should eq(@parents[0..9])
      end
    end


    describe "find_next" do
      before :each do
        @category = FactoryGirl.build(:category, :name => "General")

        @parents = []

        30.times do |i|
          @parents << FactoryGirl.create(:news_item, :headline => "headline#{i}", :created_at => Time.now - (1000 * i), :categories => [@category])
        end
      end
      it "should load 10 records, newest first, excluding the first 10" do
        NewsItem.find_next.should eq(@parents[10..19])
        NewsItem.find_next(page = 1).should eq(@parents[10..19])
      end
      it "should load up to 10 more records, newest first, excluding the offset" do
        NewsItem.find_next(page = 2).should eq(@parents[20..29])
      end
      it "should load no more records, if there are no more to display" do
        NewsItem.find_next(page = 3).should eq([])
      end
    end

    describe "find_next_product_update" do
      before :each do
        @category = FactoryGirl.build(:category, :name => "Product updates")

        @parents = []

        30.times do |i|
          @parents << FactoryGirl.create(:news_item, :headline => "headline#{i}", :created_at => Time.now - (1000 * i), :categories => [@category])
        end
      end
      it "should load 10 records, newest first, excluding the first 10" do
        NewsItem.find_next_product_update.should eq(@parents[10..19])
        NewsItem.find_next_product_update(page = 1).should eq(@parents[10..19])
      end
      it "should load up to 10 more records, newest first, excluding the offset" do
        NewsItem.find_next_product_update(page = 2).should eq(@parents[20..29])
      end
      it "should load no more records, if there are no more to display" do
        NewsItem.find_next_product_update(page = 3).should eq([])
      end
    end
  end
end
