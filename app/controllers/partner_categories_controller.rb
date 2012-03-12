class PartnerCategoriesController < ApplicationController
  def index
    @partner_categories = PartnerCategory.find_in_order
    @page = Page.find_by_name('Get d3')
  end

  def show
    @partner_category = PartnerCategory.find(params[:id])
  end
end
