require 'rails_helper'

RSpec.describe Coupon, type: :model do
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
