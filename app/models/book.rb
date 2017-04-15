class Book < ApplicationRecord
  validates :title, :price, :quantity, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  def check_count?(count)
    self.quantity >= count ? true : false
  end

  def purchase_of_book(count)
      self.update(quantity: self.quantity - count) if check_count?(count) 
  end
end
