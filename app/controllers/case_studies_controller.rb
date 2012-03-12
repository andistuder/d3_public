class CaseStudiesController < ApplicationController

  def index
    @case_studies = CaseStudy.find_in_order
    @page = Page.find_by_name('Case Studies')
  end

  def show
    @case_study = CaseStudy.find(params[:id])
  end

end