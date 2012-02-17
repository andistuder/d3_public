class ProjectCategory < ActiveRecord::Base

  validates_presence_of :name, :summary, :content, :slug

  has_and_belongs_to_many :projects

end