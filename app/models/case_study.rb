class CaseStudy < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug, use: :slugged

  validates_presence_of :name, :case_study_category_name, :summary, :slug, :assets

  has_and_belongs_to_many :assets
  has_and_belongs_to_many :features

  def self.find_in_order
    CaseStudy.order("sort_order ASC")
  end

  def find_previous
    self.class.first(:conditions => ["sort_order < ?", sort_order], :order => "sort_order DESC")
  end

  def find_next
    self.class.first(:conditions => ["sort_order > ?", sort_order], :order => "sort_order ASC")
  end

end
