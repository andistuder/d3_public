class PartnerCategory < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  validates_presence_of :name, :slug

  has_and_belongs_to_many :assets
  has_many :partners

  def self.find_in_order
    PartnerCategory.order("sort_order ASC")
  end

  def foreign_partners
    self.partners.reject{|p| p.name == "d3 Technologies"}
  end

  def d3_partners
    self.partners.select{|p| p.name == "d3 Technologies"}
  end

end