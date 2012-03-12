require 'spec_helper'

describe CaseStudiesController do

  describe "GET show" do

    before :each do
      @test_cs = FactoryGirl.build :case_study
      CaseStudy.should_receive(:find).and_return(@test_cs)
    end

    it "should be successful" do
      get 'show', :id => 1
      response.should be_success
    end

    it "assigns @case_study" do
      get 'show', :id => 1
      assigns(:case_study).should eq(@test_cs)
    end
  end

  describe "GET index" do
    before :each do
      @test_cs = FactoryGirl.build :case_study, :sort_order => 1
      @test_cs1 = FactoryGirl.build :case_study, :sort_order => 2
      @page = FactoryGirl.build :page
      CaseStudy.should_receive(:find_in_order).and_return([@test_cs, @test_cs1])
      Page.should_receive(:find_by_name).and_return(@page)
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns @case_studies" do
      get 'index'
      assigns(:case_studies).should eq([@test_cs, @test_cs1])
    end

    it "assigns @page" do
      get 'index'
      assigns(:page).should eq(@page)
    end
  end


end
