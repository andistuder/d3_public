class ProjectContentArea < ActiveRecord::Base

  validates_presence_of :title, :content, :asset

  belongs_to :project
  belongs_to :asset

  scope :ordered, order("sort_order ASC")

end