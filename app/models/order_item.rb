class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book

  before_save :finalize
  after_save { order.save! }
  after_destroy { order.save! }

  validates :quantity, numericality: { greater_than: 0,
                                       less_than_or_equal_to: 99 }

  def unit_price
    if persisted?
      self[:unit_price]
    else
      book.price
    end
  end

  def increment_count
    self[:quantity] =  quantity < 99 ? quantity + 1 : 99
  end

  def decrement_count
    self[:quantity] =  quantity > 1 ? quantity - 1 : 1
  end
  
  def total_price
    unit_price * quantity
  end

  private

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = total_price
  end
end
