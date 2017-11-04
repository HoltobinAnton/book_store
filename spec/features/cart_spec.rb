require 'rails_helper'

feature 'the cart inetface' do

  let(:user) { create :user }
  let(:order_with_oi) { create :order, :with_items, user: user }
  let(:oi_first) { order_with_oi.order_items.first }

  scenario 'should display link cart is empty adn redirect to root_path' do
    visit cart_path
    expect(page).to have_link I18n.t('back')
    click_link I18n.t('back')
    expect(page).to have_current_path(root_path)
  end

  scenario 'should dispalay update cart and checkout buttons' do
    allow_any_instance_of(ApplicationController).to receive(:current_order)
      .and_return(order_with_oi)
    visit cart_path
    expect(page).to have_button('Checkout')
    expect(page).to have_button('Update cart')
  end

  scenario 'should display an order item' do
    allow_any_instance_of(ApplicationController).to receive(:current_order)
      .and_return(order_with_oi)
    visit cart_path
    expect(page).to have_content(oi_first.book.title)
    expect(page).to have_content(oi_first.book.price)
    expect(page).to have_xpath("//input[@value=#{oi_first.quantity}]")
    expect(page).to have_content(oi_first.unit_price)
    expect(page).to have_content(oi_first.total_price)
  end
  
  scenario 'should dispalay the total price order' do
    allow_any_instance_of(ApplicationController).to receive(:current_order)
      .and_return(order_with_oi)
    visit cart_path
    expect(page).to have_content(order_with_oi.sub_total)
    expect(page).to have_content(order_with_oi.order_total)
  end  
end 