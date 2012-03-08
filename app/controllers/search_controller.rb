class SearchController < ApplicationController
  def search
    @projects = Project.find_with_index(params[:query],{:limit => 10})
    @news = NewsItem.find_with_index(params[:query],{:limit => 10})
    @features = Feature.find_with_index(params[:query],{:limit => 10})
    #@results_news = Organisation.with_query(params[:query]).paginate(:page => params[:page])
  end

end