class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  def return_book_id
    params[:review][:book_id]
  end
end
