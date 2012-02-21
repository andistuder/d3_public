class PartnerCategoriesController < ApplicationController

  def index
    @partner_categories = PartnerCategory.all
  end

  def show
    @partner_category = PartnerCategory.find(params[:id])
  end

end
