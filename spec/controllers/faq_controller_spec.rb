require 'spec_helper'

describe FaqController do
  before :each do

    @faqs = []
    @faq_cats = []

    2.times do |i|
      @faqs <<  Factory.build(:faq, :sort_order => i)
    end

    2.times do |j|
      @faq_cats << Factory.build(:faq_category, :sort_order => j)
    end

  end


  describe "GET 'index'" do

    before :each do
      Faq.should_receive(:order).with("sort_order ASC").and_return(@faqs)
      FaqCategory.should_receive(:order).with("sort_order ASC").and_return(@faq_cats)
    end

    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "assigns collection of faq cats" do
      get 'index'
      assigns(:faq_categories).should eq(@faq_cats)
    end

    it "assigns collection of faqs" do
      get 'index'
      assigns(:faqs).should eq(@faqs)
    end

  end

  describe "GET 'show'" do

    before :each do
      FaqCategory.should_receive(:find).and_return(@faq_cats[0])
      FaqCategory.should_receive(:order).with("sort_order ASC").and_return(@faq_cats)
    end

    it "returns http success" do
      get 'show'
      response.should be_success
    end

    it "assigns collection of faq cats" do
      get 'show', :id => "category-1"
      assigns(:faq_categories).should eq(@faq_cats)
    end

    it "assigns an faq_cat" do
      get 'show', :id => "category-1"
      assigns(:faq_category).should eq(@faq_cats[0])
    end

  end

end
