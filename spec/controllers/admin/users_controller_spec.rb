require 'spec_helper'

describe Admin::UsersController do

  describe "#index" do

    it "should assign @users" do
      users = Object.new
      stub(User).paginate(:page => "2") { users }
      get :index, :page => "2"
      assigns[:users].should be(users)
    end

    it "should paginate the users" do
      users = []
      mock(User).paginate(:page => "2") { users }
      get :index, :page => "2"
    end

    it "should default to page #1" do
      users = []
      mock(User).paginate(:page => "1") { users }
      get :index
    end

  end

  describe "#show" do

    before do
      @user = User.make
      stub(User).find(@user.id.to_s) { @user }
      @coupons = Object.new
      stub(@coupons).paginate(anything) { @coupons }
      stub(@user).coupons { @coupons }
      get :show, :id => @user.id.to_s
    end

    it "should assign the user to @user" do
      assigns[:user].should be(@user)
    end

    it "should assign the users's coupons to @coupons" do
      assigns[:coupons].should be(@coupons)
    end

  end

end
