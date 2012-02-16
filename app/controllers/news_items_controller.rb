class NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.find_newest_two
  end

  def show
    @news_item = NewsItem.find(params[:id])
  end

  def next
    @news_items = NewsItem.find_next_twenty(params[:offset])
    render :index
  end
end
