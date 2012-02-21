class Partner < ActiveRecord::Base

  extend FriendlyId
  friendly_id :slug, use: :slugged

  validates_presence_of :name, :slug

  has_and_belongs_to_many :assets
  belongs_to :partner_category

end