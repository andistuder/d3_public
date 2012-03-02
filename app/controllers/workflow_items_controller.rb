class WorkflowItemsController < ApplicationController

  def index
    @workflow_items = WorkflowItem.all(:order => "sort_order ASC")
  end

end
