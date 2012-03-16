class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
    @project_categories = ProjectCategory.find_in_order

    @og_title = @project.name
    if @project.assets.present?
      @og_image = @project.assets.first.asset.url(:original) if @project.assets.first.asset.present?
    end
    @og_description = textilize(@project.summary).strip_tags

  end

  def index
    @project_categories = ProjectCategory.find_in_order
    @page = Page.find_by_name('Projects')
    @featured_projects = Project.limit(9)

    @og_title = "Featured Projects - #{@og_site_name}"

  end

end
