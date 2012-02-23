require 'spec_helper'

describe Page do
  it "can be instantiated" do
    Page.new.should be_an_instance_of(Page)
  end
  
  it "has many assets" do
    Page.reflect_on_association(:assets).should_not be_nil
    @page = Page.new
    @page.assets.length == 0
  end
    
  it "has many content_areas" do
    Page.reflect_on_association(:content_areas).should_not be_nil
    @page = Page.new
    @page.content_areas.length == 0
  end
    
  it "has many categories" do
    Page.reflect_on_association(:categories).should_not be_nil
    @page = Page.new
    @page.categories.length == 0
  end

  it "has a name that is required" do
    @page = Page.new
    @page.respond_to?(:name).should be_true
    @page.should_not be_valid
  end

  it "has a slug that is required" do
    @page = Page.new
    @page.respond_to?(:slug).should be_true
    @page.should_not be_valid
  end

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
