class Project < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug, use: :slugged

  validates_presence_of :name, :summary, :concept, :how_made, :slug

  has_and_belongs_to_many :assets
  has_and_belongs_to_many :project_categories
  belongs_to :left_image, :class_name => "Asset"
  belongs_to :right_image, :class_name => "Asset"
  has_and_belongs_to_many :features

end
