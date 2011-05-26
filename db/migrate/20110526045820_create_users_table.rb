class CreateUsersTable < ActiveRecord::Migration

  def self.up
    create_table :users do |t|
      t.string :facebook_id
      t.timestamps
    end
    add_column :coupons, :user_id, :integer, :null => true
    add_index :coupons, [ :user_id ], :name => 'coupons_user_id_index'
  end

  def self.down
    remove_index :coupons, :name => 'coupons_user_id_index'
    remove_column :coupons, :user_id
    drop_table :users
  end

end
