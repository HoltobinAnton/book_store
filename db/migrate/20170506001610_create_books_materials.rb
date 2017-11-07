class CreateBooksMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :books_materials, id: false do |t|
      t.references :book, foreign_key: true
      t.references :material, foreign_key: true
    end
  end
end
