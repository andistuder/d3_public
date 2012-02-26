class Faq < ActiveRecord::Base
  validates_presence_of :question, :answer

  has_and_belongs_to_many :categories, :class_name => "FaqCategory"

  extend FriendlyId
  friendly_id :question, :use => :slugged
end
