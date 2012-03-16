class WorkflowItemsController < ApplicationController

  def index
    @workflow_items = WorkflowItem.all(:order => "sort_order ASC")
    @page = Page.find_by_name('Workflow')

    @og_title = "Workflow - #{@og_site_name}"
  end

end
