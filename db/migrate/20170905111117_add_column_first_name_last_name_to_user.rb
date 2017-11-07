class AddColumnFirstNameLastNameToUser < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :first_name, :string, limit: 50
    add_column :users, :last_name, :string, limit: 50
  end

  def self.down
    remove_column :first_name, :users
    remove_column :last_name, :users
  end
end
