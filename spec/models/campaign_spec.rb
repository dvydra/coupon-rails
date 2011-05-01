require 'spec_helper'

describe Campaign do

  it "should validate the presence of name" do
    Campaign.make_unsaved(:name => nil).should_not be_valid
    Campaign.make_unsaved(:name => "xyz").should be_valid
  end

  describe "#find" do

    it "should default to sort by modification date descending" do
      first, second = 2.times.map { Campaign.make }
      first.update_attribute(:updated_at, Date.today + 1.day)
      second.update_attribute(:updated_at, Date.today + 2.days)
      Campaign.find(:all).should == [ second, first ]
      first.update_attribute(:updated_at, Date.today + 3.days)
      Campaign.find(:all).should == [ first, second ]
    end

  end

end
