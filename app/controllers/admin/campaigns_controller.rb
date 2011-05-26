module Admin

  class CampaignsController < AdminController

    def show
      @campaign = Campaign.find(params[:id])
      @coupons = @campaign.coupons.paginate(:page => params[:page] || "1")
    end

    def index
      @campaigns = Campaign.paginate(:page => params[:page] || "1")
    end

    def new
      @campaign = Campaign.new
    end

    def create
      campaign = Campaign.create!(params[:campaign])
      campaign.upload_coupons(params[:coupons_file]) if params[:coupons_file]
      flash[:success] = "Campaign created"
      redirect_to admin_campaign_path(campaign)
    end

  end

end
