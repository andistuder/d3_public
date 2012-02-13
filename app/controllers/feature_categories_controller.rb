class FeatureCategoriesController < ApplicationController

  def index
    @feature_categories = FeatureCategory.all
  end

  def show
    @feature_category = FeatureCategory.find(params[:id])
    @feature_categories = FeatureCategory.all
  end

end
