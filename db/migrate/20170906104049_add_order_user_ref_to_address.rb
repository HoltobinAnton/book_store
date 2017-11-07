class AddOrderUserRefToAddress < ActiveRecord::Migration[5.0]
  def self.up
    add_reference :addresses, :order, index: true
    add_column :addresses, :address, :string, limit: 50
  end

  def self.down
    remove_reference :addresses, :order
    remove_column :addresses, :address
  end
end
