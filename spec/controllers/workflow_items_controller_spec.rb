require 'spec_helper'

describe WorkflowItemsController do

  describe "GET index" do
    before :each do
      @wfi = FactoryGirl.build :workflow_item, :sort_order => 1
      @wfi1 = FactoryGirl.build :workflow_item, :sort_order => 2
      WorkflowItem.should_receive(:all).and_return([@wfi, @wfi1])
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns @workflow_items" do
      get 'index'
      assigns(:workflow_items).should eq([@wfi, @wfi1])
    end
  end
end