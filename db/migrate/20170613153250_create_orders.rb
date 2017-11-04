class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user
      t.decimal :sub_total, precision: 7, scale: 2
      t.decimal :order_total, precision: 7, scale: 2
      t.string :state
      t.timestamps
    end
  end
end
