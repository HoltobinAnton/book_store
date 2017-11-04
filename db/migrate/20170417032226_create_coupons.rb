class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :secret_code
      t.integer :used_count
      t.timestamps
    end
  end
end
