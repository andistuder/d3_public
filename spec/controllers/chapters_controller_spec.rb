require 'spec_helper'

describe ChaptersController do

  before :each do

    @parents = []

    15.times do |i|
      @parents << FactoryGirl.build(:chapter, :name => "parent_chapter#{i}", :created_at => Time.now - (1000 * i))
    end

    @chapter = Factory.build(:chapter)

    Chapter.should_receive(:find_parents).and_return(@parents)
    Chapter.should_receive(:find).with("1").and_return(@chapter)
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => "1"
      response.should be_success

      assigns(:chapter).should eq(@chapter)
      assigns(:chapters).should eq(@parents)
    end
  end

end
