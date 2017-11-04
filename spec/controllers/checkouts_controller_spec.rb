require 'rails_helper'

RSpec.describe CheckoutsController, type: :controller do
  let(:user) { create :user }
  let(:order) { create :order, user: user }

  before do
    sign_in user
    allow(controller).to receive(:check_order_for_checkouts)
      .and_return(true)
  end

  describe 'GET #show' do
    it 'address step' do
      allow(controller).to receive(:order).and_return(order)
      get :show, params: { id: :address }
      expect(response).to render_template :address
    end
    it 'delivery step' do
      get :show, params: { id: :delivery }
      expect(response).to render_template :delivery
    end
    it 'payment step' do
      get :show, params: { id: :payment }
      expect(response).to render_template :payment
    end
    it 'confirm step' do
      get :show, params: { id: :confirm }
      expect(response).to render_template :confirm
    end
    it 'complete step' do
      get :show, params: { id: :complete }
      expect(response).to render_template :complete
    end
  end

  describe 'PUT #update' do
    context 'address step' do
      it 'should redirect to payment' do
        params = address_params
        params[:id] = 'address'
        put :update, params: params
        expect(response).to redirect_to checkout_path(:delivery)
      end

      it 'should not redirect to the next step' do
        put :update, params: { id: :address }
        expect(response).to redirect_to checkout_path(:address)
      end
    end

    context 'delivery step' do
      let(:delivery) { create :delivery }
      it 'should redirect to delivery' do
        params = { delivery: delivery.id }
        params[:id] = 'delivery'
        put :update, params: params
        expect(response).to redirect_to checkout_path(:payment)
      end

      it 'should not redirect to the next step' do
        put :update, params: { id: :delivery }
        expect(response).to redirect_to checkout_path(:delivery)
      end
    end

    context 'payment step' do
      it 'should redirect to delivery' do
        params = valid_credit_card
        params[:id] = 'payment'
        put :update, params: params
        expect(response).to redirect_to checkout_path(:confirm)
      end

      it 'should not redirect to the next step' do
        params = invalid_credit_card
        params[:id] = 'payment'
        put :update, params: params
        expect(response).to redirect_to checkout_path(:payment)
      end
    end
  end

  describe 'finish wizard and confirm email' do
    it 'should redirect to root_path' do
      get(:finish_wizard, params: { id: 'complete' })
      expect(response).to redirect_to root_path
    end

    it 'should redirect_to root_path' do
      get :confirm_email, params: { id: '12331' }
      expect(response).to redirect_to root_path
    end

    it 'success flash message' do
      order.confirmation_token
      get :confirm_email, params: { id: order.confirm_token }
      expect(flash[:danger]).to eq I18n.t('flash.checkout.i_confirm')
    end
  end
end
