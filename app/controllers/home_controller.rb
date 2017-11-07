class HomeController < ApplicationController
  def index
    @best_sellers = Book.best_sellers
    @new_books = Book.new_books_slider
  end
end
