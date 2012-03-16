class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @project_categories = ProjectCategory.find_in_order
  end

  def index
    @project_categories = ProjectCategory.find_in_order
    @page = Page.find_by_name('Projects')
    @featured_projects = Project.limit(9)
  end

end
