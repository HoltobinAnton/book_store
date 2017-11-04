require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  let(:book) { create :book }

  describe 'GET #index' do
    it 'assigns @books' do
      get :index
      expect(assigns(:books)).to eq([book])
    end
    it 'should render the action show' do
      get :index
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #show' do
    before do
      get :index
    end
    it 'assigns books' do
      book_second = create :book
      expect(assigns(:books)).to eq([book, book_second])
    end
    it { is_expected.to render_template :show }
    it { is_expected.to respond_with :ok }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to respond_with_content_type :html }
  end
end
