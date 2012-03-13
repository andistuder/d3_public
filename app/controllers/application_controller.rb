class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_facebook_headers

  before_filter :get_related_boxes

  before_filter :get_latest_news

  private

  def get_related_boxes
    selector = request.fullpath.split('/')[1]
    if Page.find_by_slug(selector).present?
      @related_boxes = Page.find_by_slug(selector).related_boxes.limit(4)
    elsif Page.find_by_slug('home').present?
      @related_boxes = Page.find_by_slug('home').related_boxes.limit(4)
    else
      @related_boxes = RelatedBox.limit(4)
    end
  end

  def set_facebook_headers
    @og_title = D3::Application::SITE_NAME
    @og_type = "website"
    @og_url = D3::Application::SITE_URL
    @og_image = D3::Application::SITE_LOGO
    @og_site_name = D3::Application::SITE_NAME
    @og_admins = D3::Application::FB_ADMIN
    if Page.find_by_slug('company').present?
      @og_description = textilize(Page.find_by_slug('company').introduction).strip_tags
    end
  end

  def get_latest_news
    @news_items = NewsItem.find_latest
  end

end
