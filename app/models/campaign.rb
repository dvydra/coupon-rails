class Campaign < ActiveRecord::Base

  has_many :coupons

  validates_presence_of :name

  cattr_reader :per_page
  @@per_page = 10

  default_scope order("updated_at DESC")

end
