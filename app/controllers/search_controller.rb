class SearchController < ApplicationController
  def search
    @projects = Project.find_with_index(params[:query],{:limit => 20})
    @news = NewsItem.with_query(params[:query]).find_latest
    #@news = NewsItem.with_query(params[:query]).order('created_at DESC').find(:all, :limit => 10)
    @features = Feature.find_with_index(params[:query],{:limit => 30})
    @case_studies = CaseStudy.find_with_index(params[:query],{:limit => 10})
    @partners = Partner.find_with_index(params[:query],{:limit => 10})
    @downloads = Download.with_query(params[:query]).order('created_at DESC').find(:all, :limit => 10)
    @faqs = Faq.find_with_index(params[:query],{:limit => 20})
    @chapters = Chapter.where('parent_id > 0').find_with_index(params[:query],{:limit => 20})
    page_id = Page.find_by_name('Tutorials').id
    @tutorials = ContentArea.with_query(params[:query]).where(:page_id => page_id).limit(10)
  end

end