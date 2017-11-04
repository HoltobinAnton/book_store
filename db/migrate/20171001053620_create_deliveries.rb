class CreateDeliveries < ActiveRecord::Migration[5.0]
  def change
    create_table :deliveries do |t|
      t.decimal :price, precision: 7, scale: 2
      t.string :name
      t.integer :min_day
      t.integer :max_day
      t.integer :cvv
      t.timestamps
    end
  end
end
