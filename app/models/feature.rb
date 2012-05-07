class Feature < ActiveRecord::Base

  belongs_to :feature_category
  belongs_to :asset
  has_and_belongs_to_many :projects

  validates_presence_of :slug, :name, :feature_category

  extend FriendlyId
  friendly_id :name, :use => :slugged

  acts_as_indexed :fields => [:name, :content]

  scope :ordered, order("sort_order ASC")

end