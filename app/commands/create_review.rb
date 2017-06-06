class CreateReview < Rectify::Command
  VALID_STR = 'Thanks for Review. It will be published as soon
               as Admin will approve it'.freeze
  INVALID_STR = 'An error has occurred'.freeze

  def initialize(options)
    @user = options[:user]
    @params = options[:params]
  end

  def call
    if review_form.invalid?
      broadcast :invalid, INVALID_STR
    else
      transaction do
        create_review
        broadcast :valid, VALID_STR
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