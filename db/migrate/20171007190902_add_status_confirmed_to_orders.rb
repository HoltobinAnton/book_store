class AddStatusConfirmedToOrders < ActiveRecord::Migration[5.0]
  def self.up
    add_column :orders, :status_confirmed, :boolean, default: false
  end

  def self.down
    remove_column :orders, :status_confirmed
  end
end
