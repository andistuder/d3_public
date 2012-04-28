require 'spec_helper'

describe ChaptersController do

  before :each do
    @parents = []

    15.times do |i|
      @parents << FactoryGirl.build(:chapter, :name => "parent_chapter#{i}", :created_at => Time.now - (1000 * i))
    end

    @user_guide_intro = FactoryGirl.build(:user_guide)
    @user_guide_body = FactoryGirl.build(:user_guide)

    @chapter = @parents[1]

    Chapter.should_receive(:find_parents).and_return(@parents)
    Chapter.should_receive(:find).with("1").and_return(@chapter)
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => "1"
      response.should be_success

      assigns(:chapter).should eq(@chapter)

    end
  end

  it "assigns collection of chapters" do
    get 'show', :id => "1"
    assigns(:chapters).should eq(@parents)
  end

  it "assigns the chapter index" do
    get 'show', :id => "1"
    assigns(:index).should eq(2)
  end

end
