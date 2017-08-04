require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  let(:book) { create :book }
  let(:user) { create :user }
  let(:review) { create :review, user: user, book: book }
  describe 'POST #create' do
    let(:params) { { review: review } }
    before do
      sign_in user
    end
    context 'valid params' do
      it 'should create review' do
        allow_any_instance_of(CanCan::ControllerResource)
          .to receive(:load_and_authorize_resource) { nil }
        allow(controller).to receive(:params).and_return(params)
        expect(CreateReview).to receive(:call).with(user: user, params: params)
        post :create, params: params
      end
    end
    #context 'flash messages' do
    #  before do
    #    stub_const('CreateReview', Support::Command::Valid)
    #    allow_any_instance_of(CanCan::ControllerResource)
    #      .to receive(:load_and_authorize_resource) { nil }
    #    post :create, params: params
    #  end
    #  it 'valid flash messages' do
    #    expect(flash.now[:notice]).to eq('Thanks for Review.')
    #  end
    #end
  end
end
