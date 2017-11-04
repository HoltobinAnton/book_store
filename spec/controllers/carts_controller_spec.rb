require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let(:order_with_oi) { create :order, :with_items }
  context 'GET #show' do
    it 'assigns @order_items' do
      allow_any_instance_of(ApplicationController).to receive(:current_order)
        .and_return(order_with_oi)
      get :show
      expect(assigns(:order_items)).to eq(order_with_oi.order_items)
    end
    before do
      get :show
    end
    it { is_expected.to render_template :show }
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to respond_with_content_type :html }
  end

  context 'PUT #update' do
    let(:coupon) { create :coupon }
    let(:params) { { secret_code: coupon.secret_code } }
    it 'Coupon activation' do
      allow(controller).to receive(:params).and_return(params)
      put :update, format: :js
      expect(flash.now[:success]).to eq I18n.t('flash.coupon.valid')
      expect(response).to_not be_redirect
    end
    it 'invalid params' do
      params = { secret_code: Faker::Lorem.sentence(31) }
      allow(controller).to receive(:params).and_return(params)
      put :update, format: :js
      expect(flash.now[:danger]).to eq I18n.t('flash.coupon.invalid')
    end
  end
end
