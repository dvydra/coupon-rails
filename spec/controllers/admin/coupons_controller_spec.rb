require 'spec_helper'

describe Admin::CouponsController do

  describe "#index" do

    def campaign
      unless @campaign
        @campaign = Campaign.make
        stub(Campaign).find(@campaign.id) { @campaign }
      end
      @campaign
    end

    it "should assign @coupons" do
      coupons = Object.new
      stub(campaign.coupons).paginate(:page => "2") { coupons }
      get :index, :page => "2", :campaign_id => campaign.id.to_s
      assigns[:coupons].should be(coupons)
    end

    it "should paginate the coupons" do
      coupons = []
      mock(campaign.coupons).paginate(:page => "2") { coupons }
      get :index, :page => "2", :campaign_id => campaign.id.to_s
    end

    it "should default to page #1" do
      coupons = []
      mock(campaign.coupons).paginate(:page => "1") { coupons }
      get :index, :campaign_id => campaign.id.to_s
    end

  end

end
