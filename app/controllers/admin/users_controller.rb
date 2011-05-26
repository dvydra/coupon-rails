module Admin

  class UsersController < AdminController

    def index
      @users = User.paginate(:page => params[:page] || "1")
    end

    def show
      @user = User.find(params[:id])
      @coupons = @user.coupons.paginate(:page => params[:page])
    end

  end

end
