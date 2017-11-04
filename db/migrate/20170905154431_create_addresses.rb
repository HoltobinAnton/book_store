class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :city, limit: 50
      t.integer :zip
      t.string :phone, limit: 15
      t.references :user, foreign_key: true
    end
  end
end
