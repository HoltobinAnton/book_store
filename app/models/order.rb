class Order < ApplicationRecord
  has_many :order_items
  belongs_to :user
  before_save :update_subtotal

  #validates :sub_total, :order_total, presence: true

  def subtotal_count
    order_items.collect do |oi|
      p oi.valid? ? (oi.quantity * oi.unit_price) : 0

      oi.valid? ? (oi.quantity * oi.unit_price) : 0
    end.sum
  end

  def order_total_count
    checked_discount.nil? ? (sub_total - discount) : sub_total
  end

  def checked_discount
    return 0 if discount.eql?(0) || discount >= sub_total
  end

  private

  def update_subtotal
    self[:sub_total] = subtotal_count
    self[:order_total] = order_total_count
  end

end
