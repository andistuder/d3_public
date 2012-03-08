class Page < ActiveRecord::Base

  has_many :content_areas
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :assets
  has_and_belongs_to_many :related_boxes

  validates_presence_of :name

  acts_as_taggable
  acts_as_tree :order => "name"

  extend FriendlyId
  friendly_id :name, :use => :slugged


  def self.find_page(slug)
    slug = "home" if !slug.present?
    Page.where(:slug => slug).limit(1).first
  end

  def layout
    self.slug.gsub(" ", "_").gsub("-", "_")
  end
end
