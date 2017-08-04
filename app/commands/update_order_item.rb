class UpdateOrderItem < Rectify::Command
  def initialize(order_item, params)
    @order_item = order_item
    @increment = params[:increment]
    @quantity = params[:quantity].nil? ? 1 : params[:quantity].to_i
  end

  def call
    return broadcast :invalid, item_errors if order_item_invalid?
    if @increment.eql?('true')
      @order_item.increment_count
    elsif @increment.eql?('false')
      @order_item.decrement_count
    else
      @order_item.update_attributes(quantity: @quantity)
    end
    @order_item.save
  end

  private

  def order_item_invalid?
    @order_item.nil? || quantity?
  end

  def quantity?
    @quantity >= 1 && @quantity <= 99 ? false : true
  end

  def item_errors
    @order_item.errors.full_messages if @order_item.present?
  end
end