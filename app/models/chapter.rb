class Chapter < ActiveRecord::Base
  validates_presence_of :name, :summary, :content, :slug

  extend FriendlyId
  friendly_id :name, :use => :slugged

  acts_as_tree :order => "sort_order"

  scope :find_parents, :order=>"sort_order ASC", :conditions => "parent_id IS NULL"

end
