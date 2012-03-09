class Download < ActiveRecord::Base
  validates_presence_of :name, :content

  has_and_belongs_to_many :categories, :class_name => "DownloadCategory"

  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_attached_file :item, :storage => :s3, :s3_credentials => "#{Rails.root}/config/s3.yml", :bucket => 'd3-downloads', :path => ":attachment/:id/:filename"

  acts_as_indexed :fields => [:name, :summary, :content]

  def self.find_latest
    Download.order("created_at DESC").limit(D3::Application::NEWS_INITIAL_LOAD)
  end

  def self.find_next(page = 1)

    offset = page.to_i <= 1 ?  0 : D3::Application::NEWS_PAGE_SIZE * (page.to_i - 1)
    offset += D3::Application::NEWS_INITIAL_LOAD

    Download.order("created_at DESC").offset(offset).limit(D3::Application::NEWS_PAGE_SIZE)
  end


end
