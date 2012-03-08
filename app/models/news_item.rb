class NewsItem < ActiveRecord::Base
  validates_presence_of :headline, :content

  has_and_belongs_to_many :assets

  extend FriendlyId
  friendly_id :headline, :use => :slugged

  acts_as_indexed :fields => [:headline, :content]

  def self.find_latest
    NewsItem.order("created_at DESC").limit(D3::Application::NEWS_INITIAL_LOAD)
  end

  def self.find_next(page = 1)

    offset = page.to_i <= 1 ?  0 : D3::Application::NEWS_PAGE_SIZE * (page.to_i - 1)
    offset += D3::Application::NEWS_INITIAL_LOAD

    NewsItem.order("created_at DESC").offset(offset).limit(D3::Application::NEWS_PAGE_SIZE)
  end
end
