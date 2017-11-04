class CartsController < ApplicationController
  before_action :order, only: [:update]
  def show
    @order_items = current_order.order_items
  end

  def update
    coupon = CouponForm.from_params(params)
    CheckCoupon.call(coupon) do
      on(:valid) { flash.now[:success] = t('flash.coupon.valid') }
      on(:invalid) { flash.now[:danger] = t('flash.coupon.invalid') }
      on(:deactivated) { flash.now[:warning] = t('flash.coupon.deactivated') }
    end
  end

  private

  def order
    @order ||= current_order
  end
end
