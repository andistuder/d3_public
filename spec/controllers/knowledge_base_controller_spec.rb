require 'spec_helper'

describe KnowledgeBaseController do

  before :each do
    @parents = []

    15.times do |i|
      @parents << FactoryGirl.build(:chapter, :name => "parent_chapter#{i}", :created_at => Time.now - (1000 * i))
    end
    @user_guide_intro = FactoryGirl.build(:user_guide)
    @user_guide_body = FactoryGirl.build(:user_guide)
  end

  describe "GET user_guide" do

    before :each do
      Chapter.should_receive(:find_parents).and_return(@parents)
      ContentArea.should_receive(:find_by_name).with("user_guide_intro").and_return(@user_guide_intro)
      ContentArea.should_receive(:find_by_name).with("user_guide_body").and_return(@user_guide_body)
    end

    it "should be successful" do
      get :user_guide
      response.should be_success
    end

    it "assigns collection of chapters" do
      get :user_guide
      assigns(:chapters).should eq(@parents)
    end

    it "retrieves the user guide intro &body" do
      get :user_guide
      assigns(:user_guide_intro).should eq(@user_guide_intro)
      assigns(:user_guide_body).should eq(@user_guide_body)
    end
  end

end
