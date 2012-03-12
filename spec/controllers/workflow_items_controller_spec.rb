require 'spec_helper'

describe WorkflowItemsController do

  describe "GET index" do
    before :each do
      @wfi = FactoryGirl.build :workflow_item, :sort_order => 1
      @wfi1 = FactoryGirl.build :workflow_item, :sort_order => 2
      @page = FactoryGirl.build :page

      WorkflowItem.should_receive(:all).and_return([@wfi, @wfi1])
      Page.should_receive(:find_by_name).and_return(@page)
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns @workflow_items" do
      get 'index'
      assigns(:workflow_items).should eq([@wfi, @wfi1])
    end

    it "assigns @page" do
      get 'index'
      assigns(:page).should eq(@page)
    end
  end
end