class CheckCoupon < Rectify::Command
  def initialize(form)
    @form = form
  end

  def call
    return broadcast :invalid if form.invalid?
    if form.valid? && coupon.present?
      transaction do
        update_order 1
        broadcast :valid
      end
    elsif !check_active?
      transaction do
        update_order
        broadcast :deactivated
      end
    end
  end

  private

  attr_reader :form

  def coupon
    @coupon ||= Coupon.where(secret_code: form[:secret_code]).first
  end

  def update_order(discount = 0)
    if discount.zero?
      current_order.update_attributes(discount: 0)
    else
      current_order.update_attributes(discount: coupon.discount)
    end
  end

  def check_active?
    current_order.discount.zero?
  end
end