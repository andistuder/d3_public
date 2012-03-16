class PartnerCategoriesController < ApplicationController
  def index
    @partner_categories = PartnerCategory.find_in_order
    @page = Page.find_by_name('Get d3')
    @og_title = "Get d3 - #{@og_site_name}"
  end

  def show
    @partner_category = PartnerCategory.find(params[:id])
    @og_title = "#{@partner_category.name} - #{@og_site_name}"
    if @partner_category.assets.present?
      @og_image = @partner_category.assets.first.asset.url(:original) if @partner_category.assets.first.asset.present?
    end
    @og_description = textilize(@partner_category.content).strip_tags if @partner_category.content.present?
  end
end
