class AddOrderIdToDelivery < ActiveRecord::Migration[5.0]
  def self.up
    add_reference :orders, :delivery
  end

  def self.down
    remove_reference :orders, :delivery
  end
end
