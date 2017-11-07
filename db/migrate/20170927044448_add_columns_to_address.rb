class AddColumnsToAddress < ActiveRecord::Migration[5.0]
  def self.up
    add_column :addresses, :first_name, :string
    add_column :addresses, :last_name, :string
  end

  def self.down
    remove_column :addresses, :first_name
    remove_column :addresses, :last_name
  end
end
