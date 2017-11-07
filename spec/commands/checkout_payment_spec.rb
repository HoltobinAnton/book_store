require 'rails_helper'

RSpec.describe CheckoutPayment do
  let(:order) { create :order, :with_items }

  describe 'method #call' do
    it 'should return the valid broadcast' do
      subject = CheckoutPayment.new(order, valid_credit_card)
      expect { subject.call }.to broadcast(:valid)
    end

    it 'should return the invalid broadcast' do
      subject = CheckoutPayment.new(order, invalid_credit_card)
      expect { subject.call }.to broadcast(:invalid)
    end
  end
end