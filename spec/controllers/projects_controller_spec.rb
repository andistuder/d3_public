require 'spec_helper'

describe ProjectsController do

  describe "GET show" do

    before :each do
      @test_project = FactoryGirl.build :project
      Project.should_receive(:find).and_return(@test_project)
    end

    it "should be successful" do
      get 'show', :id => 1
      response.should be_success
    end

    it "assigns @project" do
      get 'show', :id => 1
      assigns(:project).should eq(@test_project)
    end
  end

  describe "GET index" do
    before :each do
      @test_project_category = FactoryGirl.build :project_category
      @test_project_category1 = FactoryGirl.build :project_category
      ProjectCategory.should_receive(:all).and_return([@test_project_category, @test_project_category1])
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns @project" do
      get 'index'
      assigns(:project_categories).should eq([@test_project_category, @test_project_category1])
    end
  end


end
