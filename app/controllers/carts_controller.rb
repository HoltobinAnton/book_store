class CartsController < ApplicationController
  before_action :order, only: [:update]
  def show
    @order_items = current_order.order_items
  end

  def update
    coupon = CouponForm.from_params(params)
    CheckCoupon.call(coupon) do
      on(:valid) { |mess| flash.now[:success] = mess }
      on(:invalid) { |mess| flash.now[:danger] = mess }
      on(:deactivated) { |mess| flash.now[:warning] = mess }
    end
  end

  private

  def order
    @order ||= current_order
  end
end
