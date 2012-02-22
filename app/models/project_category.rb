class ProjectCategory < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug, use: :slugged

  validates_presence_of :name, :summary, :content, :slug, :projects

  has_and_belongs_to_many :projects

  def self.find_in_order
    ProjectCategory.order("sort_order ASC")
  end


  #def previous_feature_cat
  #  self.class.first(:conditions => ["sort_order < ?", sort_order], :order => "sort_order desc")
  #end
  #
  #def next_feature_cat
  #  self.class.first(:conditions => ["sort_order > ?", sort_order], :order => "sort_order asc")
  #end

end