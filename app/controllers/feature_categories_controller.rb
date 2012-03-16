class FeatureCategoriesController < ApplicationController

  def index
    @feature_categories = FeatureCategory.order("sort_order asc")
    @page = Page.find_by_name('Features')
    @og_title = "Features - #{@og_site_name}"
  end

  def show
    @feature_category = FeatureCategory.find(params[:id])
    @feature_categories = FeatureCategory.order("sort_order asc")

    @og_title = @feature_category.name
    if @feature_category.assets.present?
      @og_image = @feature_category.assets.first.asset.url(:original) if @feature_category.assets.first.asset.present?
    end
    @og_description = textilize(@feature_category.content).strip_tags if @feature_category.content.present?
  end

end
