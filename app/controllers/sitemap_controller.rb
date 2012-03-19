class SitemapController < ApplicationController

  layout false
  
  def sitemap
    @pages = Page.all
    @news_items = NewsItem.find_latest
    @announcements = NewsItem.find_latest_product_updates
    @projects = Project.all
    @case_studies = CaseStudy.find_in_order
    @feature_categories = FeatureCategory.all
    @downloads = Download.limit(20)
  end
end
