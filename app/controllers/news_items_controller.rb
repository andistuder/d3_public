class NewsItemsController < ApplicationController
  def index
    #@news_items = NewsItem.find_latest #moved to application controller as used in news ticker
  end

  def announcements
    @news_items = NewsItem.find_latest_product_updates
  end

  def show
    @news_item = NewsItem.find(params[:id])
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
