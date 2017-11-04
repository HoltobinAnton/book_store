class AddDefaultValueStateToOrder < ActiveRecord::Migration[5.0]
  def self.up
    change_column :orders, :state, :string, default: 'waiting_processing'
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"
  end
end
