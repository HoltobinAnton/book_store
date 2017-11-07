class CreateBooksCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :books_categories, id: false do |t|
      t.references :book, foreign_key: true
      t.references :category, foreign_key: true
    end
  end
end
