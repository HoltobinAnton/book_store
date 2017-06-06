class ReviewsController < ApplicationController
  load_and_authorize_resource only: [:create]

  def create
    CreateReview.call(user: current_user, params: params) do
      on(:valid) do |mess|
        flash[:notice] = mess
      end
      on(:invalid) do |mess|
        flash[:notice] = mess
      end
    end
    redirect_to book_path(params[:review][:book_id])
  end

  private

  def review_params
    params.require(:review).permit!
  end
end