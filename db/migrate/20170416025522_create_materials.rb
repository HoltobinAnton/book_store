class CreateMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :materials do |t|
      t.belongs_to :book, index: true
      t.string :title

      t.timestamps
    end
  end
end
