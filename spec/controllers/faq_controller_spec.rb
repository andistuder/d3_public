require 'spec_helper'

describe FaqController do
  before :each do

    @faq_cat = nil
    @faq_cats = []

    @faq_cat = Factory.build(:faq_category)

    4.times do |k|
      @faq_cats << Factory.build(:faq_category, :sort_order => k)
    end

  end


  describe "GET 'index'" do

    describe "defaulting category" do

      before :each do
        FaqCategory.should_receive(:find_by_slug).with("most-popular").and_return(@faq_cat)
      end

      it "redirects to show with the default category" do
        get 'index'
        response.should redirect_to(:action => "show")
      end

    end

    describe "default category missing" do

      before :each do
        FaqCategory.should_receive(:find_by_slug).with("most-popular").and_return(nil)
        FaqCategory.should_receive(:first).and_return(@faq_cats[0])
      end

      it "redirects to show with the first category" do
        get 'index'
        response.should redirect_to(:action => "show")
      end
    end
  end

  describe "GET 'show'" do

    it "returns http success" do
      get 'show'
      response.should be_success
    end

    describe "defaulting a category" do
      before :each do
        FaqCategory.should_receive(:order).with("sort_order ASC").and_return(@faq_cats)
        FaqCategory.should_receive(:find).and_return(@faq_cats[0])
      end

      it "returns http success" do
        get 'show', :id => "category-1"
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
end
