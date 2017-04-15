class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string  :title
      t.float   :price
      t.integer :quantity
      t.string  :photos
      t.text    :descriprion
      t.integer :year_publication

      t.timestamps
    end
  end
end
