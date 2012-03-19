class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :set_facebook_headers

  before_filter :get_related_boxes

  before_filter :get_latest_news

  before_filter :get_footer_items

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

  def get_footer_items
    @project_categories = ProjectCategory.find_in_order
      if Page.find_by_slug('d3-consulting').present?
        @consulting_areas =  Page.find_by_slug('d3-consulting').content_areas.limit(6)
      else
        @consulting_areas = nil
      end
  end

  def set_facebook_headers
    @og_title = D3::Application::SITE_NAME
    @og_type = "website"
    @og_url = request.url
    @og_image = D3::Application::SITE_LOGO
    @og_site_name = D3::Application::SITE_NAME
    @og_admins = D3::Application::FB_ADMIN
    if Page.find_by_slug('home').present?
      @og_description = textilize(Page.find_by_slug('home').introduction).strip_tags
    else
      @og_description = ""
    end
  end

  def get_latest_news
    @news_items = NewsItem.find_latest
  end

end
