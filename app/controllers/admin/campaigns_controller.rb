module Admin

  class CampaignsController < AdminController

    def index
      @campaigns = Campaign.paginate(:page => params[:page] || "1")
    end

  end

end
