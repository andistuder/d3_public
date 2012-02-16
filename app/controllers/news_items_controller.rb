class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.find_newest_two
  end

  def show
    @news_item = NewsItem.find(params[:id])
  end
end
