class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.order("created_at DESC")
  end

  def show
    @news_item = NewsItem.find(params[:id])
  end
end
