class PartnerCategoriesController < ApplicationController

  def index
    @partner_categories = PartnerCategory.find_in_order
  end

  def show
    @partner_category = PartnerCategory.find(params[:id])
  end

end
