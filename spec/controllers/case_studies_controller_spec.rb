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
      CaseStudy.should_receive(:find_in_order).and_return([@test_cs, @test_cs1])
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns @case_studies" do
      get 'index'
      assigns(:case_studies).should eq([@test_cs, @test_cs1])
    end
  end


end
