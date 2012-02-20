class ProjectCategoriesController < ApplicationController

  def show
    @project_category = ProjectCategory.find(params[:id])
  end

end
