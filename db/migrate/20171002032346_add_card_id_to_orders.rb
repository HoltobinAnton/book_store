class AddCardIdToOrders < ActiveRecord::Migration[5.0]
  def self.up
    add_reference :orders, :credit_card
  end

  def self.down
    remove_reference :orders, :credit_card
  end
end
