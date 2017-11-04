require 'rails_helper'

RSpec.describe CheckoutAddress do
  let(:order) { create :order, :with_items }
  let(:valid_params) { address_params }

  describe 'method #call' do
    it 'should return the valid broadcast' do
      subject = CheckoutAddress.new(order, valid_params)
      expect { subject.call }.to broadcast(:valid)
    end
    it 'should return the invalid broadcast' do
      subject = CheckoutAddress.new(order, {})
      expect { subject.call }.to broadcast(:invalid)
    end
  end
end