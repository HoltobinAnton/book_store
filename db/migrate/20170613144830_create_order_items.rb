class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.references :book
      t.references :order
      t.integer :quantity
      t.float :unit_price, precision: 5, scale: 2
      t.float :total_price, precision: 7, scale: 2
      t.timestamps
    end
  end
end
