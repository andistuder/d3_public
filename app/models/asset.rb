class Asset < ActiveRecord::Base
  
  has_and_belongs_to_many :pages
  has_and_belongs_to_many :news_items
  has_and_belongs_to_many :feature_categories
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :case_studies
  has_and_belongs_to_many :partners

  validates :name, :presence => true
  validates :description, :presence => true

  has_attached_file :asset, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :bucket => 'd3-site-assets', :path => ":attachment/:id/:style.:extension", :styles => { :xl => "938x587>", :large => "717x448>", :medium => "358x224>", :small => "246x154>", :thumb => "40x40>" }
  #has_attached_file :asset, :styles => { :medium => "120x120>", :thumb => "40x40>" }
  
  attr_accessor :delete_image
  before_save { self.asset   = nil if self.delete_image == '1' }
  
  def asset_s3_url
    self.asset.url
  end

end
