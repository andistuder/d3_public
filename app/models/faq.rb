class Faq < ActiveRecord::Base
  validates_presence_of :question, :answer

  has_and_belongs_to_many :categories, :class_name => "FaqCategory"

  acts_as_indexed :fields => [:question, :answer]

  extend FriendlyId
  friendly_id :question, :use => :slugged

  default_scope :order => 'sort_order ASC'

end
