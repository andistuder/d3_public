class ChapterContentArea < ActiveRecord::Base
  validates_presence_of :title, :content

  has_and_belongs_to_many :assets
  belongs_to :chapter

  acts_as_indexed :fields => [:title, :content]

  scope :ordered, order("sort_order ASC")

end
