class Chapter < ActiveRecord::Base
  validates_presence_of :name, :summary, :content, :slug

  extend FriendlyId
  friendly_id :name, :use => :slugged

  acts_as_tree :order => "sort_order"

  has_many :content_areas, :class_name => "ChapterContentArea"

  scope :find_parents, :order=>"sort_order ASC", :conditions => "parent_id IS NULL"

  acts_as_indexed :fields => [:name, :summary, :content]

end
