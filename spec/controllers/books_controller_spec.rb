require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book) { create :book }
 
  before do
    get :show, params: { id: book.id }
    allow_any_instance_of(CanCan::ControllerResource)
      .to receive(:load_and_authorize_resource) { nil }
  end

  context 'GET #show' do
    let(:params) { { id: book.id } }
    it 'assigns @book' do
      expect(assigns(:book)).to eq(book.decorate)
    end
    it 'assigns @order_item' do
      expect(assigns(:order_item)).to_not be_nil
    end
    it { is_expected.to render_template :show }
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to respond_with_content_type :html }
  end
end
