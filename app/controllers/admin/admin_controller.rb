module Admin

  class AdminController < ApplicationController

    layout "admin"

  end

  def self.admin_pages
    [
      { :title => "Home",       :path => :admin_root      },
      { :title => "Campaigns",  :path => :admin_campaigns },
      { :title => "Users",      :path => :admin_users     }
    ]
  end

end