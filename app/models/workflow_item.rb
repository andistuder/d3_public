class WorkflowItem < ActiveRecord::Base

  validates_presence_of :title, :list_title, :content_area, :list_area, :overlay

  belongs_to :asset

end
