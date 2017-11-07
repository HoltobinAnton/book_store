require 'rails_helper'

feature 'change items from cart', type: :feature do
  let(:order_item) { create :order_item }
  let(:order_with_oi) { create :order, order_items: [order_item] }

  background do
    allow_any_instance_of(ApplicationController).to receive(:current_order)
      .and_return(order_with_oi)
    visit cart_path
  end
  scenario 'should decrement the count when user press a minus', js: true do
    expect{
      first('i.fa.fa-minus.line-height-40.input-link').click
      wait_for_ajax
    }.to change { order_item.reload.quantity }.by(-1)
  end

  scenario 'should increment the count to 1 when user press a plus', js: true do
    expect{  
      first('i.fa.fa-plus.line-height-40.input-link').click
      wait_for_ajax
    }.to change { order_item.reload.quantity }.by(1)
  end

  scenario 'Should change  the value after the loss of focus', js: true do
    first('input.form-control.quantity-input').set('12')
    page.first('p.title').click
    wait_for_ajax
    expect(order_item.reload.quantity).to eq(12)
  end

  scenario 'Should not change  the value after the loss of focus', js: true do
    first('input.form-control.quantity-input').set('qwe')
    page.first('p.title').click
    wait_for_ajax
    expect(accept_alert).to eq('The value must be an integer 1..99')
    expect(order_item.reload.quantity).to eq(1)
  end

  scenario 'Should not increase the value ', js: true do
    order_item.update_attribute(:quantity, 99)
    expect{
      first('i.fa.fa-plus.line-height-40.input-link').click
      wait_for_ajax
    }.to_not change { order_item.reload.quantity }
  end

  scenario 'Should not decrease the value ', js: true do
    order_item.update_attribute(:quantity, 1)
    expect{
      first('i.fa.fa-minus.line-height-40.input-link').click
      wait_for_ajax
    }.to_not change { order_item.reload.quantity }
  end
end
