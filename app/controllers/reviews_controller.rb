class ReviewsController < ApplicationController
  load_and_authorize_resource only: [:create]

  def create
    CreateReview.call(current_user, params) do
      on(:valid) { flash[:notice] = t('flash.review.valid') }
      on(:invalid) { flash[:notice] = t('flash.review.invalid') }
    end
    redirect_to book_path(review_params[:book_id])
  end

  private

  def review_params
    params.require(:review).permit!
  end
end