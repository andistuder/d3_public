class NewsItemsController < ApplicationController
  def index
    #@news_items = NewsItem.find_latest #moved to application controller as used in news ticker
    @og_title = "News - #{@og_site_name}"
  end

  def announcements
    @news_items = NewsItem.find_latest_product_updates
    @og_title = "Announcements - #{@og_site_name}"
  end

  def show
    @news_item = NewsItem.find(params[:id])

    @og_title = @news_item.headline
    if @news_item.assets.present?
      @og_image = @news_item.assets.first.asset.url(:original) if @news_item.assets.first.asset.present?
    end
    @og_description = textilize(@news_item.content).strip_tags

  end

  def next
    @news_items = NewsItem.find_next(params[:page])
    status = @news_items.length > 0 ? 200 : 204
    render :next, :status => status, :layout => false
  end

  def next_announcements
    @news_items = NewsItem.find_next_product_update(params[:page])
    status = @news_items.length > 0 ? 200 : 204
    render :next, :status => status, :layout => false
  end
end
