class NewsItem < ActiveRecord::Base
  validates_presence_of :headline, :content

  has_and_belongs_to_many :assets
  has_and_belongs_to_many :categories

  extend FriendlyId
  friendly_id :headline, :use => :slugged

  acts_as_indexed :fields => [:headline, :content]

  default_scope :order => "created_at DESC"

  #def self.find_general_news
  #  NewsItem.select{|h| h.categories.include?(Category.find_by_name('General'))}
  #end
  #
  #def self.find_product_updates
  #  NewsItem.select{|h| h.categories.include?(Category.find_by_name('Product updates'))}
  #end

  def self.find_latest
    NewsItem.select{|h| h.categories.include?(Category.find_by_name('General'))}.take(D3::Application::NEWS_INITIAL_LOAD)
  end

  def self.find_next(page = 1)

    offset = page.to_i <= 1 ?  0 : D3::Application::NEWS_PAGE_SIZE * (page.to_i - 1)
    offset += D3::Application::NEWS_INITIAL_LOAD

    NewsItem.select{|h| h.categories.include?(Category.find_by_name('General'))}.drop(offset).take(D3::Application::NEWS_PAGE_SIZE)
  end
end
