class ContentArea < ActiveRecord::Base
  
  belongs_to :page
  belongs_to :asset
  
  validates_presence_of :name

  default_scope :order => 'sort_order ASC'

  acts_as_indexed :fields => [:name, :content]


end
