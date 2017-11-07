class CreateAuthorsBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :authors_books, id: false do |t|
      t.belongs_to :author, foreign_key: true
      t.belongs_to :book, foreign_key: true
    end
  end
end
