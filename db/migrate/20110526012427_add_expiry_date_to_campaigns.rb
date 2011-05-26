class AddExpiryDateToCampaigns < ActiveRecord::Migration

  def self.up
    add_column :campaigns, :expiry_date, :date
  end

  def self.down
    remove_column :campaigns, :expiry_date
  end

end
