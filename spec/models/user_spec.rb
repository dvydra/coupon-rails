require 'spec_helper'

describe User do

  it "should validate the presence of facebook_id" do
    User.make_unsaved(:facebook_id => nil).should_not be_valid
    User.make_unsaved(:facebook_id => "xyz").should be_valid
  end

  it "should validate the uniqueness of facebook_id" do
    User.make(:facebook_id => "xyz")
    User.make_unsaved(:facebook_id => "zyx").should be_valid
    User.make_unsaved(:facebook_id => "xyz").should_not be_valid
  end

  describe "#find" do

    it "should default to sort by modification date descending" do
      first, second = 2.times.map { User.make }
      first.update_attribute(:updated_at, Date.today + 1.day)
      second.update_attribute(:updated_at, Date.today + 2.days)
      User.find(:all).should == [ second, first ]
      first.update_attribute(:updated_at, Date.today + 3.days)
      User.find(:all).should == [ first, second ]
    end

  end

end
