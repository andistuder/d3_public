class FeatureCategory < ActiveRecord::Base

  has_many :features
  has_and_belongs_to_many :assets

  validates_presence_of :name, :slug

  def previous_feature_cat
    self.class.first(:conditions => ["sort_order < ?", sort_order], :order => "sort_order desc")
  end

  def next_feature_cat
    self.class.first(:conditions => ["sort_order > ?", sort_order], :order => "sort_order asc")
  end

end
