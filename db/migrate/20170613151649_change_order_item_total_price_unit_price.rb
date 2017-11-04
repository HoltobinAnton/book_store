class ChangeOrderItemTotalPriceUnitPrice < ActiveRecord::Migration[5.0]
  def up
    change_table :order_items do |t|
      t.change :total_price, :decimal, precision: 7, scale: 2
      t.change :unit_price, :decimal, precision: 5, scale: 2
      t.change :quantity, :integer, default: 1
    end
  end

  def down
    change_table :order_items do |t|
      t.change :total_price, :float
      t.change :unit_price, :float
      t.change :quantity, :integer
    end
  end
end
