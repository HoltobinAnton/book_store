class BooksController < ApplicationController
  load_and_authorize_resource only: [:show]
  
  def show
    @book = Book.find(params[:id]).decorate
    @order_item = current_order.order_items.new
  end
  
end
