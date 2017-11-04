require 'rails_helper'

RSpec.describe SetUserService do
  let(:address) { create :address }
  let(:user) { address.user }
  let(:valid_papams) { valid_address_bill }

  describe 'method #call' do
    it 'should return the valid broadcast' do
      subject = SetUserService.new(user, valid_papams)
      expect { subject.call }.to broadcast(:valid)
    end

    it 'should return the invalid broadcast' do
      subject = SetUserService.new(user, {})
      expect { subject.call }.to broadcast(:invalid)
    end
  end
end