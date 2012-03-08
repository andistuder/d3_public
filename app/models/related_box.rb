class RelatedBox < ActiveRecord::Base
  validates_presence_of :name, :content, :link_label, :link_url

  belongs_to :asset
  has_and_belongs_to_many :pages

  default_scope :order => 'sort_order ASC'
end
