class CaseStudiesController < ApplicationController

  def index
    @case_studies = CaseStudy.find_in_order
  end

  def show
    @case_study = CaseStudy.find(params[:id])
  end

end