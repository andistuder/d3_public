require 'spec_helper'

describe ProjectsController do
  pending "Controller tests for projects and project categories"



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


end
