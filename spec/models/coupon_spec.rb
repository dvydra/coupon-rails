require 'spec_helper'

describe Coupon do

  it "should validate the presence of code" do
    Coupon.make_unsaved(:code => nil).should_not be_valid
    Coupon.make_unsaved(:code => "xyz").should be_valid
  end

  it "should validate the presence of campaign" do
    Coupon.make_unsaved(:campaign => nil).should_not be_valid
    Coupon.make_unsaved(:campaign => Campaign.make_unsaved).should be_valid
  end

  describe "#find" do

    it "should default to sort by modification date descending" do
      first, second = 2.times.map { Coupon.make }
      first.update_attribute(:updated_at, Date.today + 1.day)
      second.update_attribute(:updated_at, Date.today + 2.days)
      Coupon.find(:all).should == [ second, first ]
      first.update_attribute(:updated_at, Date.today + 3.days)
      Coupon.find(:all).should == [ first, second ]
    end

  end

end
