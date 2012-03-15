class Project < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :summary, :how_made, :how_made_title, :assets

  has_and_belongs_to_many :assets
  has_and_belongs_to_many :project_categories
  belongs_to :how_made_image, :class_name => "Asset"
  has_and_belongs_to_many :features
  has_many :project_content_areas

  acts_as_indexed :fields => [:name, :summary]

  default_scope :order => 'sort_order ASC'

  def previous
    self.class.first(:conditions => ["created_at < ?", created_at], :order => "created_at asc")
  end

  def next
    self.class.first(:conditions => ["created_at > ?", created_at], :order => "created_at desc")
  end

end
