class CategoriesController < ApplicationController
  before_action :categories_list, only: [:show, :index]
  before_action :category, only: [:show]
  before_action :title_sort, only: [:index, :show]
  SORT_DEF = :new_books

  def index
    books = Book.all
    sort_by(books)
    render :show
  end

  def show
    books = Category.books_from_category(params[:id])
    sort_by(books)
  end

  private

  def sort_by(books)
    @books = books.send(sort_type).page(params[:page])
  end

  def categories_list
    @categories_list ||= Category.all
  end

  def category
    @category = Category.find(params[:id])
  end

  def title_sort
    @title_sort = sort_type
  end

  def sort_type
    return SORT_DEF if params[:sort_type].nil?
    params[:sort_type] 
  end
end

    