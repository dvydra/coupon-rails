class Campaign < ActiveRecord::Base

  has_many :coupons

  validates_presence_of :name
  validates_presence_of :expiry_date

  cattr_reader :per_page
  @@per_page = 10

  default_scope order("expiry_date")

end
