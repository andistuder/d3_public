class PartnersController < ApplicationController

  def show
    @partner = Partner.find(params[:id])

    @og_title = @partner.name
    if @partner.assets.present?
      @og_image = @partner.assets.first.asset.url(:original) if @partner.assets.first.asset.present?
    end
    @og_description = textilize(@partner.summary).strip_tags

  end

end