require 'spec_helper'

describe NewsItem do
  it "can be instantiated" do
    NewsItem.new.should be_an_instance_of(NewsItem)
  end

  it { should validate_presence_of(:headline) }
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:slug) }

  it { should have_and_belong_to_many(:assets) }


  describe "database finders" do

    describe "find_latest" do
      before :each do
        @parents = []

        5.times do |i|
          @parents << FactoryGirl.create(:news_item, :headline => "headline#{i}", :created_at => Time.now - (1000 * i))
        end
      end
      it "should load 2 records, newest first" do
        NewsItem.find_latest.should eq(@parents[0..1])
      end
    end
  end

  describe "find_next" do
    before :each do
      @parents = []

      30.times do |i|
        @parents << FactoryGirl.create(:news_item, :headline => "headline#{i}", :created_at => Time.now - (1000 * i))
      end
    end
    it "should load 20 records, newest first, excluding the first 2" do
      NewsItem.find_next.should eq(@parents[2..21])
      NewsItem.find_next(page = 1).should eq(@parents[2..21])
    end
    it "should load up to 20 more records, newest first, excluding the offset" do
      NewsItem.find_next(page = 2).should eq(@parents[22..29])
    end
    it "should load no more records, if there are no more to display" do
      NewsItem.find_next(page = 3).should eq([])
    end
  end
end
