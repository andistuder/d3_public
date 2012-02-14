class Asset < ActiveRecord::Base
  
  has_and_belongs_to_many :pages
  
  validates :name, :presence => true
  validates :description, :presence => true

  has_attached_file :asset, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :bucket => 'd3-site-assets.s3.amazonaws.com', :path => ":attachment/:id/:style.:extension", :styles => { :large => "717x448>", :thumb => "246x154>" }
  #has_attached_file :asset, :styles => { :medium => "120x120>", :thumb => "40x40>" }
  
  attr_accessor :delete_image
  before_save { self.asset   = nil if self.delete_image == '1' }
  
  def asset_s3_url
    self.asset.url
  end

end
