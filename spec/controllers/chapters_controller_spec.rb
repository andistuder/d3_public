require 'spec_helper'

describe ChaptersController do

  before :each do

    @parents = []

    15.times do |i|
      @parents << FactoryGirl.build(:chapter, :name => "parent_chapter#{i}", :created_at => Time.now - (1000 * i))
    end

    @user_guide_intro = FactoryGirl.build(:user_guide)
    @user_guide_body = FactoryGirl.build(:user_guide)

    @chapter = Factory.build(:chapter)

    Chapter.should_receive(:find_parents).and_return(@parents)
    Chapter.should_receive(:find).with("1").and_return(@chapter)
    ContentArea.should_receive(:find_by_name).with("user_guide_intro").and_return(@user_guide_intro)
    ContentArea.should_receive(:find_by_name).with("user_guide_body").and_return(@user_guide_body)

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

  it "retrieves the user guide intro &body" do
    get 'show', :id => "1"
    assigns(:user_guide_intro).should eq(@user_guide_intro)
    assigns(:user_guide_body).should eq(@user_guide_body)
  end

end
