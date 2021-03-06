class SearchController < ApplicationController
  def search
    @projects = Project.find_with_index(params[:query],{:limit => 20})
    @news = NewsItem.with_query(params[:query]).find_latest
    @features = Feature.find_with_index(params[:query],{:limit => 30}).reject{|f| !f.feature_category.present?}
    @case_studies = CaseStudy.find_with_index(params[:query],{:limit => 10})
    @partners = Partner.find_with_index(params[:query],{:limit => 10}).reject{|p| !p.partner_category.present?}
    @downloads = Download.with_query(params[:query]).order('created_at DESC').limit(10)
    @faqs = Faq.find_with_index(params[:query],{:limit => 20})
    @chapters = Chapter.where('parent_id is not Null').find_with_index(params[:query],{:limit => 20})
    tutorial_id = 0
    if Page.find_by_name('Tutorials').present?
      tutorial_id = Page.find_by_name('Tutorials').id
    end
    @tutorials = ContentArea.with_query(params[:query]).where(:page_id => tutorial_id).limit(10)
  end

end