class DownloadCategory < ActiveRecord::Base
  validates_presence_of :name

  extend FriendlyId
  friendly_id :name, :use => :slugged

  has_and_belongs_to_many :downloads
end
