class Coupon < ActiveRecord::Base

  belongs_to :campaign
  belongs_to :user

  validates_presence_of :code
  validates_uniqueness_of :code

  validates_presence_of :campaign

  cattr_reader :per_page
  @@per_page = 25

  default_scope order("updated_at DESC")

end
