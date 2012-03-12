require 'spec_helper'

describe SearchController do

  describe "GET 'search'" do
    before :each do
      #@projects = FactoryGirl.build :project
      #@news_item = FactoryGirl.build :news_item
      #@feature = FactoryGirl.build :feature_item
      #@case_study = FactoryGirl.build :case_study
      #@partner = FactoryGirl.build :partner
      #@download = FactoryGirl.build :download
      #@faq = FactoryGirl.build :faq
      #@chapter = FactoryGirl.build :chapter
      #@tutorial = FactoryGirl.build :tutorial_ca, :page => Factory(:page)

      Project.should_receive(:find_with_index).and_return([])
      NewsItem.stub_chain(:with_query, :find_latest).and_return([])
      Feature.should_receive(:find_with_index).and_return([])
      CaseStudy.should_receive(:find_with_index).and_return([])
      Partner.should_receive(:find_with_index).and_return([])
      Download.stub_chain(:with_query, :order, :limit).and_return([])
      Faq.should_receive(:find_with_index).and_return([])
      Chapter.stub_chain(:where,:find_with_index).and_return([])
      ContentArea.stub_chain(:with_query, :where,:limit).and_return([])
    end

    it "should be successful" do
      get 'search'
      response.should be_success
    end

    it "should assign results" do
      get 'search', :query => "something"
      assigns(:projects).should be_empty
      assigns(:news).should be_empty
      assigns(:features).should be_empty
      assigns(:case_studies).should be_empty
      assigns(:downloads).should be_empty
      assigns(:partners).should be_empty
      assigns(:faqs).should be_empty
      assigns(:chapters).should be_empty
      assigns(:tutorials).should be_empty
    end
  end
end
