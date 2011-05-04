
module Admin

  class CouponsController < AdminController

    def index
      @campaign = Campaign.find(params[:campaign_id].to_i)
      @coupons = @campaign.coupons.paginate(:page => params[:page] || "1")
    end

  end

end