class Chapter < ActiveRecord::Base
  validates_presence_of :name, :content, :slug

  extend FriendlyId
  friendly_id :name, :use => :slugged

  acts_as_tree :order => "sort_order"

  has_many :content_areas, :class_name => "ChapterContentArea"

  scope :find_parents, :order=>"sort_order ASC", :conditions => "parent_id IS NULL"

  acts_as_indexed :fields => [:name, :content]

  def previous_chapter
    self.class.find_parents.last(:conditions => ["sort_order < ?", sort_order])
  end

  def next_chapter
    self.class.find_parents.first(:conditions => ["sort_order > ?", sort_order])
  end


end
