class ChangeColumnNameCountryId < ActiveRecord::Migration[5.0]
  def self.up
    remove_reference :addresses, :county
    add_reference :addresses, :country
  end

  def self.down
    remove_reference :addresses, :country
  end
end
