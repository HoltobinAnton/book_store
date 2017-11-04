class RemoveBookIdFromMaterials < ActiveRecord::Migration[5.0]
  def self.up
    remove_reference :materials, :book
  end

  def self.down
    add_reference :materials, :book
  end
end
