require 'rails_helper'

feature 'Delivery step' do
  let(:user) { create :user }
  let(:order) { create :order, :with_items, user: user }
  background do
    visit root_path
    click_link I18n.t('sign_in')
    fill_in_signin_fields(user.email, user.password)
    allow_any_instance_of(CheckoutsController).to receive(:current_order)
      .and_return(order)
    allow_any_instance_of(CheckoutsController).to receive(:check_order_for_checkouts)
      .and_return(true)
  end

  scenario 'delivery step' do
    create :delivery, price: 700
    visit checkouts_path(id: :delivery )
    expect { 
      click_button I18n.t('save_and_continue')
    }.to change(order, :order_total).by(700)
  end
end