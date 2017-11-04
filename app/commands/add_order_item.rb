class AddOrderItem < Rectify::Command
  INVALID_STR = 'An error has occurred'.freeze

  def initialize(order, params)
    @order = order
    @book_id = params[:order_item][:book_id].to_i
    @quantity = params[:order_item][:quantity].to_i
  end
  
  def call
    return broadcast :invalid, INVALID_STR if order_item_invalid?
    if !order_item.nil?
      order_item.increment!(:quantity, @quantity)
    else
      @order_item = @order.order_items.new(order_item_params)
    end
    save_order
  end

  private

  def order_item_params
    { order_id: @order.id, quantity: @quantity, book_id: @book_id }
  end

  def order_item
    @order_item ||= @order.order_items.where(book_id: @book_id).first
  end

  def order_item_invalid?
    @order.nil? || quantity?
  end

  def quantity?
    @quantity >= 1 && @quantity <= 99 ? false : true
  end


  def save_order
    @order.save
    session[:order_id] = @order.id
  end
end