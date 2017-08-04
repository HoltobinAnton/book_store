class OrderItemsController < ApplicationController
  before_action :order_item, only: [:update, :destroy]
  after_action :order_items, only: [:update, :destroy]
  
  def create
    AddOrderItem.call(current_order, params) do
      on(:invalid) { |errors| flash.now[:danger] = errors }
    end
  end

  def update
    UpdateOrderItem.call(order_item, params) do
      on(:invalid) { |errors| flash.now[:danger] = errors }
    end
  end

  def destroy
    @order_item.destroy
  end

  private

  def order_item
    @order_item ||= current_order.order_items.find(params[:id])
  end

  def order_items
    @order_items = current_order.order_items
  end
end
