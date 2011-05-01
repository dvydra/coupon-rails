require 'spec_helper'

describe Admin::CouponsController do

  describe "#index" do

    it "should assign @coupons" do
      coupons = Object.new
      stub(Coupon).paginate(:page => "2") { coupons }
      get :index, :page => "2"
      assigns[:coupons].should be(coupons)
    end

    it "should paginate the coupons" do
      coupons = []
      mock(Coupon).paginate(:page => "2") { coupons }
      get :index, :page => "2"
    end

    it "should default to page #1" do
      coupons = []
      mock(Coupon).paginate(:page => "1") { coupons }
      get :index
    end

  end

end
