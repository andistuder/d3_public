class Feature < ActiveRecord::Base

  belongs_to :feature_category
  belongs_to :asset

  validates_presence_of :slug, :name

end