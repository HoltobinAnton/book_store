require 'rails_helper'

describe CouponForm, type: :model do
  context 'check the secret_code' do
    it { is_expected.to validate_presence_of(:secret_code) }
    it 'validate_length_of secret_code' do
      should validate_length_of(:secret_code).is_at_most(30)
    end
  end
end