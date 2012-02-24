class PartnerCategory < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :slug

  has_and_belongs_to_many :assets
  has_many :partners

  def self.find_in_order
    PartnerCategory.order("sort_order ASC")
  end

end