require 'rails_helper'

RSpec.describe Coupon, type: :model do
  describe 'can not be nil (secret_code, discount)' do
    [:secret_code, :discount].each do |attr|
      it { is_expected.to validate_presence_of(attr) }
    end
  end

  describe 'Check the secret code' do
    it 'should pass code validation' do
      coupon = create(:coupon)
      expect(coupon.check_secret_code?('Q12345')).to be true
    end
    it 'should not pass the code validation' do
      coupon = create(:coupon)
      expect(coupon.check_secret_code?('test_secret_code')).to be false
    end
  end
end
