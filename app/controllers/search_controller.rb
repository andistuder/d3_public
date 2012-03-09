class SearchController < ApplicationController
  def search
    @projects = Project.find_with_index(params[:query],{:limit => 20})
    @news = NewsItem.find_with_index(params[:query],{:limit => 10})
    @features = Feature.find_with_index(params[:query],{:limit => 30})
    @case_studies = CaseStudy.find_with_index(params[:query],{:limit => 10})
    @partners = Partner.find_with_index(params[:query],{:limit => 10})
    @downloads = Download.find_with_index(params[:query],{:limit => 20})
    @faqs = Faq.find_with_index(params[:query],{:limit => 20})
    @chapters = ChapterContentArea.find_with_index(params[:query],{:limit => 20})
    #@tutorials = ContentArea.where(:page.name => 'Tutorials').find_with_index(params[:query],{:limit => 10})
  end

end