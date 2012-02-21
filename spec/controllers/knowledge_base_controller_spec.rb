require 'spec_helper'

describe KnowledgeBaseController do

  before :each do
    @parents = []

    15.times do |i|
      @parents << FactoryGirl.build(:chapter, :name => "parent_chapter#{i}", :created_at => Time.now - (1000 * i))
    end
  end

  describe "GET user_guide" do

    before :each do
      #@expected = @test_chapters[0..1]
      Chapter.should_receive(:find_parents).and_return(@expected)
    end

    it "should be successful" do
      get :user_guide
      response.should be_success
    end

    it "assigns collection of chapters" do
      get :user_guide
      assigns(:chapters).should eq(@expected_range)
    end
  end

end
