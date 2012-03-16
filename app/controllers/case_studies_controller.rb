class CaseStudiesController < ApplicationController

  def index
    @case_studies = CaseStudy.find_in_order
    @page = Page.find_by_name('Case Studies')
    @og_title = "Case Studies - #{@og_site_name}"
  end

  def show
    @case_study = CaseStudy.find(params[:id])

    @og_title = @case_study.name
    if @case_study.assets.present?
      @og_image = @case_study.assets.first.asset.url(:original) if @case_study.assets.first.asset.present?
    end
    @og_description = textilize(@case_study.summary).strip_tags

  end

end