class Page < ActiveRecord::Base

  has_many :content_areas
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :assets

  validates_presence_of :name, :slug

  acts_as_taggable
  acts_as_tree :order => "name"

  def self.find_page(slug)
    slug = "home" if !slug.present?
    Page.where(:slug => slug).limit(1).first
  end

  def layout
    self.name.gsub(" ", "_").gsub("-", "_")
  end
end
