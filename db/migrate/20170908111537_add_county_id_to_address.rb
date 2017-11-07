class AddCountyIdToAddress < ActiveRecord::Migration[5.0]
  def self.up
    add_reference :addresses, :county
  end

  def self.down
    remove_reference :addresses, :county
  end
end
