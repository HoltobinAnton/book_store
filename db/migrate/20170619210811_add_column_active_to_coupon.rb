class AddColumnActiveToCoupon < ActiveRecord::Migration[5.0]
  def self.up
    add_column :coupons, :active, :boolean, default: true
  end

  def self.down
    remove_column :coupons, :active
  end
end
