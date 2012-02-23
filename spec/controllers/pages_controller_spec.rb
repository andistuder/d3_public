require 'spec_helper'

describe PagesController do

  before :each do
    @page = mock_model(Page, {:name => "test-page", :slug => "test-page"})
  end

  describe "GET 'dynamic'" do


    describe "with page & layout found" do
      before :each do
        Page.should_receive(:find_page).and_return(@page)
        @page.should_receive(:layout).and_return("test-page")
      end


      it "should be successful" do
        get 'dynamic', :slug => "test-page"
        response.should be_success
      end

    end

    describe "with page not found" do
      before :each do
        Page.should_receive(:find_page).and_return(nil)
      end

      it "should be raise and error if page not found" do
        lambda { get 'dynamic', :slug => "" }.should raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end
