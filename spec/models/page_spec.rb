require 'spec_helper'

describe Page do
  it "can be instantiated" do
    Page.new.should be_an_instance_of(Page)
  end

  it { should validate_presence_of(:name) }

  it { should have_and_belong_to_many(:assets) }
  it { should have_many(:content_areas) }
  it { should have_and_belong_to_many(:categories) }
  it { should have_and_belong_to_many(:related_boxes) }

  it "has tags" do
    @page = Page.new
    @page.respond_to?(:tag_list).should be_true
  end

  it "acts as tree" do
    @page = Page.new
    @page.respond_to?(:parent).should be_true
  end

  it "has friendly_id" do
    @page = Page.new
    @page.respond_to?(:friendly_id).should be_true
  end

  describe "database finders" do

    describe "find_page" do
      before :each do

        @pages = []
        3.times do |i|
          @pages << FactoryGirl.create(:tutorial_page, :name => "some-page", :slug => "some-page", :created_at => Time.now - (1000 * i))
        end

        @pages << FactoryGirl.create(:tutorial_page, :name => "home", :slug => "home", :created_at => Time.now - (100000))

      end
      it "should find the first, newest page that matches" do

        page = Page.find_page("some-page")
        page.should eq(@pages[0])
        page.layout.should eq("some_page")

      end

      it "should default to the home page" do
        page = Page.find_page(nil)
        page.should eq(@pages[3])
        page.layout.should eq("home")
      end

    end
  end
end
