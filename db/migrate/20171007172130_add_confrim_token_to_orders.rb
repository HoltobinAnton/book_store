class AddConfrimTokenToOrders < ActiveRecord::Migration[5.0]
  def self.up
    add_column :orders, :confirm_token, :string
  end

  def self.dowm
    remove_column :orders, :confirm_token
  end
end
