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

end
