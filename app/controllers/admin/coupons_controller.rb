
module Admin

  class CouponsController < AdminController

    def index
      @coupons = Coupon.paginate(:page => params[:page] || "1")
    end

  end

end