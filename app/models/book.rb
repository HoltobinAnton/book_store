class Book < ApplicationRecord
  validates :title, :price, :quantity, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :materials
  has_many :pictures, as: :imageable
  belongs_to :dimension

  def check_count?(count)
    self.quantity >= count ? true : false
  end

  def purchase_of_book(count)
      self.update(quantity: self.quantity - count) if check_count?(count) 
  end

  def total_price(count)
    self.price * count if check_count?(count)
  end
end
