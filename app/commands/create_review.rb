class CreateReview < Rectify::Command
  def initialize(user, params)
    @user = user
    @params = params
  end

  def call
    if review_form.invalid?
      broadcast :invalid
    else
      transaction do
        create_review
        broadcast :valid
      end
    end
  end

  private

  attr_reader :params, :user

  def review_form
    @review_form ||= ReviewForm.from_params(review_params)
  end

  def review_params
    params[:review].merge(user_id: user.id)
  end

  def create_review
    Review.create(review_form.to_h)
  end

end