class AddColumnDiscountToOrder < ActiveRecord::Migration[5.0]
  def self.up
    add_column :orders, :discount, :decimal, precision: 4, scale: 2, default: 0
  end

  def self.down
    remove_column :orders, :discount
  end
end
