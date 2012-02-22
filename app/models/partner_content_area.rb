class PartnerContentArea < ActiveRecord::Base

  validates_presence_of :title, :content

  belongs_to :partner

  scope :ordered, order("sort_order ASC")

end