require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:book) { create :book }
  let(:user) { create :user }
  let(:attr_review) { attributes_for(:review) }

  describe 'POST #create' do
    before do
      sign_in user
      allow_any_instance_of(CanCan::ControllerResource).
        to receive(:load_and_authorize_resource) { nil }
    end
    context 'valid params' do
      it 'should create review' do
        allow(controller).to receive(:review_params).and_return(book_id: book.id)
        post :create, params: { review: attr_review, book_id: book.id }
        expect(response).to redirect_to book_path(book.id)
      end
    end
    context 'flash messages' do
      let(:inv_params) { { title: '', description: 'desc', rating: '5',
        book_id: book.id } }
      let(:valid_params) { { title: 'title', description: 'desc',
        rating: '5', book_id: book.id } }
      
      it 'invalid flash messages' do
        post :create, params: { review: inv_params }
        expect(flash[:notice]).to eq I18n.t('flash.review.invalid')
      end

      it 'valid flash messages' do
        post :create, params: { review: valid_params }
        expect(flash[:notice]).to eq I18n.t('flash.review.valid')
      end
    end
  end
end
