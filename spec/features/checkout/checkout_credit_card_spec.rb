require 'rails_helper'

feature 'credit_card_step' do
  let(:user) { create :user }
  let(:order) { create :order }
  background do
    visit root_path
    click_link I18n.t('sign_in')
    fill_in_signin_fields(user.email, user.password)
    allow_any_instance_of(CheckoutsController).to receive(:current_order)
      .and_return(order)
    allow_any_instance_of(CheckoutsController).to receive(:check_order_for_checkouts)
      .and_return(true)
  end

  scenario 'should pass validations' do
    visit checkouts_path(id: :payment)
    fill_in 'card_number', with: '4312898783871528'
    fill_in 'card_name', with: 'Visa'
    fill_in 'exp-date', with: '11/17'
    fill_in 'cvv', with: '431'
    expect {
      click_button I18n.t('save_and_continue')
    }.to change(CreditCard, :count).by(1)
    expect(current_path).to eq('/checkouts/confirm')
  end

  scenario 'should not pass validations' do
    visit checkouts_path(id: :payment)
    fill_in 'card_number', with: 'Fake1111111111111'
    fill_in 'card_name', with: 'Visa'
    fill_in 'exp-date', with: '11/17'
    fill_in 'cvv', with: '431'
    expect {
      click_button I18n.t('save_and_continue')
    }.not_to change(CreditCard, :count)
    expect(current_path).to eq('/checkouts/payment')
  end
end