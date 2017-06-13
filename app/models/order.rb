class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user

  validates :sub_total, :order_total, presence: true
end
