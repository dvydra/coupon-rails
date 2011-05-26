require 'spec_helper'

describe Campaign do

  it "should validate the presence of name" do
    Campaign.make_unsaved(:name => nil).should_not be_valid
    Campaign.make_unsaved(:name => "xyz").should be_valid
  end

  it "should validate the presence of expiry_date" do
    Campaign.make_unsaved(:expiry_date => nil).should_not be_valid
    Campaign.make_unsaved(:expiry_date => Date.today).should be_valid
  end

  describe "#find" do

    it "should default to sort by expiry date" do
      campaigns = 3.times.map do |i|
        Campaign.make(:expiry_date => Date.today + i.months)
      end
      Campaign.find(:all).should == campaigns

      campaigns.each_with_index do |campaign, i|
        campaign.update_attribute(:expiry_date, Date.today + (6 - i).months)
      end
      Campaign.find(:all).should == campaigns.reverse
    end

  end

  describe "#upload_coupons" do

    it "should load coupons from the provided CSV file" do
      campaign = Campaign.make
      campaign.upload_coupons(Rails.root.join("features", "uploads", "coupons.csv"))
      campaign.coupons.should have(100).coupons
    end

    it "should add the coupons to the campaign's existing coupons" do
      campaign = Campaign.make
      campaign.coupons.make
      campaign.upload_coupons(Rails.root.join("features", "uploads", "coupons.csv"))
      campaign.coupons.should have(101).coupons
    end

    it "should ignore duplicate coupons" do
      campaign = Campaign.make
      campaign.coupons.make(:code => "SARAH-A62LwE")
      campaign.upload_coupons(Rails.root.join("features", "uploads", "coupons.csv"))
      campaign.coupons.should have(100).coupons
    end

  end

end
