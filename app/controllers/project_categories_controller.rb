class ProjectCategoriesController < ApplicationController

  def show
    @project_category = ProjectCategory.find(params[:id])
    @project_categories = ProjectCategory.find_in_order
  end

end
