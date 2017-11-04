class Category < ApplicationRecord
  validates :title, presence: true

  has_and_belongs_to_many :books
  def self.books_from_category(cat_id)
    Book.joins(:categories).where(categories: { id: cat_id })
  end

end
