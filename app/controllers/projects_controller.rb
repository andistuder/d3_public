class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def index
    @project_categories = ProjectCategory.find_in_order
  end

end
