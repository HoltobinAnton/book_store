require 'rails_helper'

RSpec.describe UpdateOrderItem do
  let(:order_item) { create :order_item }

  describe 'method call' do 
    it 'valid item' do
      subject = UpdateOrderItem.new(order_item, quantity: 32)
      expect { subject.call }.to change { order_item.reload.quantity }
    end
    [0, -10, 100, 500, 'test'].each do |value|
      it 'invalid item' do
        subject = UpdateOrderItem.new(order_item, quantity: value)
        expect { subject.call }.to broadcast(:invalid)
      end
    end
    
    it 'shoud increment quantity by 1' do
      subject = UpdateOrderItem.new(order_item, increment: 'true')
      expect { subject.call }.to change { order_item.reload.quantity }.by(1)
    end

    it 'should decrement quantity by 1' do
      subject = UpdateOrderItem.new(order_item, increment: 'false')
      expect { subject.call }.to change { order_item.reload.quantity }.by(-1)
    end

    it 'should not increment quantity by 1' do
      item = create :order_item, quantity: 99
      subject = UpdateOrderItem.new(item, increment: 'true')
      expect { subject.call }.not_to change { item.reload.quantity }
    end

    it 'should not decrement quantity by 1' do
      item = create :order_item, quantity: 1
      subject = UpdateOrderItem.new(item, increment: 'false')
      expect { subject.call }.not_to change { item.reload.quantity }
    end

  end
end