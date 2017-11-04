require 'rails_helper'

RSpec.describe CheckCoupon do
  let(:coupon) { create :coupon }
  let(:wrong_form) { CouponForm.new(secret_code: "code" * 31) }

  describe 'method #call' do
    it 'valid coupon' do
      subject = CheckCoupon.new(coupon)
      subject.stub(:update_order)
      expect { subject.call }.to broadcast(:valid)
    end

    it 'invalid coupon' do
      subject = CheckCoupon.new(wrong_form)
      expect { subject.call }.to broadcast(:invalid)
    end
  end
end