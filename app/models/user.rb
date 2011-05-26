class User < ActiveRecord::Base

  has_many :coupons

  validates_presence_of :facebook_id
  validates_uniqueness_of :facebook_id

  cattr_reader :per_page
  @@per_page = 25

  default_scope order("updated_at DESC")

end
