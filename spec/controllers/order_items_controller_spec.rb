require 'rails_helper'

RSpec.describe OrderItemsController, type: :controller do
  let(:order_with_oi) { create :order, :with_items }
  let(:order_item) { order_with_oi.order_items.first }
  let(:book_id) { order_with_oi.order_items.first.book.id }
  let(:valid_params) { { order_item: { book_id: book_id, quantity: 10 } } }
  let(:invalid_params) { { order_item: { book_id: book_id, quantity: 100 } } }
  before do
    allow_any_instance_of(ApplicationController).to receive(:current_order)
      .and_return(order_with_oi)
  end

  describe 'POST #create' do
    context 'create a new order item' do
      let(:order_item) { create :order_item }
      let(:params) { { order_item: { book_id: order_item.book.id } } }
      subject { post :create, format: :js, params: params }
      it 'should create a new order item' do
        expect { subject }.to change { OrderItem.count }.by(1)
      end
    end

    context 'check status' do
      before do
        post :create, format: :js, params: valid_params
      end
      it { is_expected.to render_template :create }
      it { is_expected.to respond_with :ok }
      it { is_expected.to respond_with_content_type :js }
    end

    context '#create with invalid params' do
      before do
        post :create, format: :js, params: invalid_params
      end
      it { is_expected.to respond_with :ok }
      it 'should display a list of errors' do
        expect(flash.now[:danger]).to_not be_nil
      end
      it 'should not be redirect' do
        expect(response).to_not be_redirect
      end
    end
  end

  describe 'PUT #update' do
    let(:params) { { increment: true, quantity: 1, id: order_item.id } }
    subject { put :update, format: :js, params: params }
    it 'update an order_item' do
      expect { subject }.to change { order_item.reload.quantity }.by(1)
    end
    context 'check status' do
      before do
        put :update, format: :js, params: params
      end
      it { is_expected.to render_template :update }
      it 'should not display messages' do
        expect(flash.now[:danger]).to be_nil
      end
      it 'should return http succes' do
        expect(response).to have_http_status(:success)
      end
      it 'should not redirect' do
        expect(response).to_not be_redirect
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:params) { delete :destroy, format: :js, params: { id: order_item.id } }
    context 'delete an item' do
      subject { params }
      it 'should delete one item' do
        expect { subject }.to change { OrderItem.count }.by(-1)
      end
    end
    context 'check status' do
      before do
        params
      end
      it { is_expected.to render_template :destroy }
      it { is_expected.to respond_with_content_type :js }
      it { is_expected.to respond_with :ok }
    end
  end
end
