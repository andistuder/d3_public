class FeatureCategory < ActiveRecord::Base

  has_many :features
  has_and_belongs_to_many :assets

  validates_presence_of :name, :slug

end
