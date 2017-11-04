class CheckoutDelivery < Rectify::Command
  def initialize(order, params)
    @order = order
    @params = params
  end

  attr_reader :params

  def call
    return broadcast :invalid if get_delivery.nil?
    transaction do
      set_delivery_to_order
    end
    broadcast :valid
  end

  private

  def set_delivery_to_order
    @order.delivery_id = get_delivery.id
    @order.set_delivery_price
  end

  def get_delivery
    @delivery ||= Delivery.where(id: params[:delivery]).first
  end
end
