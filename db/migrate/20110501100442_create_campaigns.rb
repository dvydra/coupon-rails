class CreateCampaigns < ActiveRecord::Migration

  def self.up
    create_table :campaigns do |t|
      t.string :name
      t.timestamps
    end
    add_column :coupons, :campaign_id, :integer
  end

  def self.down
    remove_column :coupons, :campaign_id
    drop_table :campaigns
  end

end
