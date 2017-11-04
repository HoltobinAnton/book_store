require 'rails_helper'

RSpec.describe CheckoutDelivery do
  let(:order) { create :order, :with_items }
  let(:delivery) { create :delivery }
  let(:params) { { delivery: delivery.id } }
 
  describe 'method #call' do
    it 'should return the valid beoadcast' do
      subject = CheckoutDelivery.new(order, params)
      expect { subject.call }.to broadcast(:valid)
    end

    it 'should return the invalid broadcast' do
      subject = CheckoutDelivery.new(order, delivery: 0)
      expect { subject.call }.to broadcast(:invalid)
    end
  end
end