class ReviewsController < ApplicationController
  load_and_authorize_resource param_method: :create_params

  def create
    @review = current_user.reviews.new(create_params)
    if @review.save
      flash[:notice] = 'Thanks for Review. It will be published as soon as Admin will approve it'
    else
      flash[:notice] = 'An error has occurred'
    end
    redirect_to @review.book
  end

  private

  def create_params
    params.require(:review).permit(:book_id, :description, :rating, :title, :user_id)
  end
end