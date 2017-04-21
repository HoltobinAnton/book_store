class AddColumnDiscountToCoupon < ActiveRecord::Migration[5.0]
  def change
    add_column :coupons, :discount, :float
  end
end
