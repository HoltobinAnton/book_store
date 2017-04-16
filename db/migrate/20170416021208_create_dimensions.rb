class CreateDimensions < ActiveRecord::Migration[5.0]
  def change
    create_table :dimensions do |t|
      t.float :H
      t.float :W
      t.float :D

      t.timestamps
    end
  end
end
