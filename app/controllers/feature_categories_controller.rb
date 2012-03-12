class FeatureCategoriesController < ApplicationController

  def index
    @feature_categories = FeatureCategory.order("sort_order asc")
    @page = Page.find_by_name('Features')
  end

  def show
    @feature_category = FeatureCategory.find(params[:id])
    @feature_categories = FeatureCategory.order("sort_order asc")
  end

end
