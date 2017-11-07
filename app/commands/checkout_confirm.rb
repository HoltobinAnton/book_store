class CheckoutConfirm < Rectify::Command
  def initialize(order, params)
    @order = order
    @params = params
  end

  def call
    return broadcast :invalid if @order.user.email.nil?
    transaction do
      send_email
    end
    broadcast :valid
  end

  private

  def send_email
    OrderNotifierMailer.send_checkorder_email(@order).deliver
  end
end