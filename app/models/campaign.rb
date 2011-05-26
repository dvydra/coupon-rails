
require 'fastercsv'

class Campaign < ActiveRecord::Base

  has_many :coupons

  validates_presence_of :name
  validates_presence_of :expiry_date

  cattr_reader :per_page
  @@per_page = 10

  default_scope order("expiry_date")

  def upload_coupons(coupons_file)
    path = coupons_file.respond_to?(:path) ? coupons_file.path : coupons_file
    FasterCSV.foreach(path, :headers => [ :code ], :skip_blanks => true) do |coupon|
      Coupon.create(:code => coupon[:code], :campaign => self)
    end
    reload
  end

end
