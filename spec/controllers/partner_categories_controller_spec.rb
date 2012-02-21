require 'spec_helper'

describe PartnerCategoriesController do

  describe "GET show" do

    before :each do
      @test_pac = FactoryGirl.build :partner_category
      PartnerCategory.should_receive(:find).and_return(@test_pac)
    end

    it "should be successful" do
      get 'show', :id => 1
      response.should be_success
    end

    it "assigns @partner_category" do
      get 'show', :id => 1
      assigns(:partner_category).should eq(@test_pac)
    end
  end

  describe "GET index" do
    before :each do
      @test_pac = FactoryGirl.build :partner_category
      @test_pac1 = FactoryGirl.build :partner_category
      PartnerCategory.should_receive(:all).and_return([@test_pac, @test_pac1])
    end

    it "should be successful" do
      get 'index'
      response.should be_success
    end

    it "assigns @partner_categories" do
      get 'index'
      assigns(:partner_categories).should eq([@test_pac, @test_pac1])
    end
  end


end
