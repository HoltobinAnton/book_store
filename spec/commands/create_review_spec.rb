require 'rails_helper'

RSpec.describe CreateReview do
  let(:book) { create :book }
  let(:user) { create :user }
  let(:valid_review) { valid_review_params(book.id) }
  let(:invalid_review) { invalid_review_params(book.id) }

  describe 'method #call' do
    it 'should return the valid broadcast' do
      subject = CreateReview.new(user, valid_review)
      expect { subject.call }.to broadcast(:valid)
    end

    it 'should return the invalid broadcast' do
      subject = CreateReview.new(user, invalid_review)
      expect { subject.call }.to broadcast(:invalid)
    end
  end
end