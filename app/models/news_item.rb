class NewsItem < ActiveRecord::Base
  validates_presence_of :headline, :summary, :content, :slug

  has_and_belongs_to_many :assets

  extend FriendlyId
  friendly_id :headline, :use => :slugged

  def self.find_newest_two
    NewsItem.order("created_at DESC").limit(2)
  end
end
