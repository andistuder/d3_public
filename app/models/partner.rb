class Partner < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :slug, :summary

  acts_as_indexed :fields => [:name, :summary, :company, :town, :country]


  has_and_belongs_to_many :assets
  belongs_to :partner_category
  belongs_to :logo, :class_name => "Asset"
  has_many :partner_content_areas

end