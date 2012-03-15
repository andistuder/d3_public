require 'spec_helper'

describe ProjectCategoriesController do
  describe "GET show" do

    before :each do
      @test_project_cat = FactoryGirl.build :project_category

      ProjectCategory.should_receive(:find).and_return(@test_project_cat)
      ProjectCategory.should_receive(:find_in_order).twice.and_return([@test_project_cat])
    end

    it "should be successful" do
      get 'show', :id => 1
      response.should be_success
    end

    it "assigns @project_category" do
      get 'show', :id => 1
      assigns(:project_category).should eq(@test_project_cat)
    end

    it "assigns @project_categories" do
      get 'show', :id => 1
      assigns(:project_categories).should eq([@test_project_cat])
    end
  end


end