class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :book

  validates :quantity, :unit_price, :total_price, presence: true
end
