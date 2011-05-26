require 'spec_helper'

describe Admin::CampaignsController do

  describe "#index" do

    it "should assign @campaigns" do
      campaigns = Object.new
      stub(Campaign).paginate(:page => "2") { campaigns }
      get :index, :page => "2"
      assigns[:campaigns].should be(campaigns)
    end

    it "should paginate the coupons" do
      campaigns = []
      mock(Campaign).paginate(:page => "2") { campaigns }
      get :index, :page => "2"
    end

    it "should default to page #1" do
      campaigns = []
      mock(Campaign).paginate(:page => "1") { campaigns }
      get :index
    end

  end

  describe "#new" do

    it "should assign a new campaign to @campaign" do
      campaign = Campaign.make
      stub(Campaign).new { campaign }
      get :new
      assigns[:campaign].should be(campaign)
    end

  end

  describe "#show" do

    before do
      @campaign = Campaign.make
      stub(Campaign).find(@campaign.id.to_s) { @campaign }
      @coupons = Object.new
      stub(@coupons).paginate(anything) { @coupons }
      stub(@campaign).coupons { @coupons }
      get :show, :id => @campaign.id.to_s
    end

    it "should assign the campaign to @campaign" do
      assigns[:campaign].should be(@campaign)
    end

    it "should assign the campaign's coupons to @coupons" do
      assigns[:coupons].should be(@coupons)
    end

  end

  describe "#create" do

    describe "with valid parameters" do

      before do
        @campaign_params = { :name => "A Campaign", :expiry_date => "2012-01-01" }
        post :create, :campaign => @campaign_params, :coupons_file => Rails.root.join("features", "uploads", "coupons.csv")
        @campaign = Campaign.find_by_name("A Campaign")
      end

      it "creates the campaign" do
        @campaign.should_not be_nil
        @campaign.name.should == @campaign_params[:name]
        @campaign.expiry_date.strftime("%Y-%m-%d").should == @campaign_params[:expiry_date]
        @campaign.coupons(true).should have(100).coupons
      end

      it "should redirect to the campaign page" do
        response.should redirect_to(admin_campaign_path(@campaign))
      end

    end

  end

end
