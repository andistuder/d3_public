class SitemapController < ApplicationController

  layout false
  
  def sitemap
    @pages = Page.all
    @news_items = NewsItem.find_latest
    @announcements = NewsItem.find_latest_product_updates
    @projects = Project.all
    @project_categories = ProjectCategory.find_in_order
    @case_studies = CaseStudy.find_in_order
    @feature_categories = FeatureCategory.all
    @downloads = Download.limit(20)
    @faq_categories = FaqCategory.all
    @partner_categories = PartnerCategory.find_in_order
    @partners = Partner.all
    @chapters = Chapter.find_parents
  end
end
