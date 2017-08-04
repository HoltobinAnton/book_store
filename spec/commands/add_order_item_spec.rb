require 'rails_helper'

RSpec.describe AddOrderItem do
  let(:order) { create :order, :with_items }
  let(:order_item) { order.order_items.first }
  let(:book_id) { order_item.book.id }
  let(:valid_params) { { order_item: { book_id: book_id, quantity: 10 } } }
  let(:invalid_params) { { order_item: { book_id: book_id, quantity: 1000 } } }

  describe 'method call' do
    it 'valid item' do
      subject = AddOrderItem.new(order, valid_params)
      subject.stub(:save_order)
      expect { subject.call }.to change { order_item.reload.quantity }
    end

    it 'invalid item' do
      subject = AddOrderItem.new(order, invalid_params)
      expect { subject.call }.to broadcast(:invalid)
    end
  end
end