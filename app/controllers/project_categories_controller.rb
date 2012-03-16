class ProjectCategoriesController < ApplicationController

  def show
    @project_category = ProjectCategory.find(params[:id])
    @project_categories = ProjectCategory.find_in_order

    @og_title = "Featured Projects - #{@og_site_name}"

  end

end
