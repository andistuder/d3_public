class Feature < ActiveRecord::Base

  belongs_to :feature_category
  belongs_to :asset
  has_and_belongs_to_many :projects

  validates_presence_of :slug, :name

  scope :ordered, order("sort_order ASC")

end