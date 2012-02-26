class Faq < ActiveRecord::Base
  validates_presence_of :question, :answer

  extend FriendlyId
  friendly_id :question, :use => :slugged
end
