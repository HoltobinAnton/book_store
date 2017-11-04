require 'rails_helper'

feature 'Coupon', type: :feature do
  let(:order_item) { create :order_item }
  let(:order_with_oi) { create :order, :with_items }
  let(:coupon) { create :coupon }

  background do
    allow_any_instance_of(ApplicationController).to receive(:current_order)
      .and_return(order_with_oi)
    visit cart_path
  end

  scenario 'Should show a discount and the flash message', js: true do
    first('#discount').set(coupon.secret_code)
    click_button('Update cart')
    wait_for_ajax
    expect(page).to have_content("Coupon €#{coupon.discount}")
    expect(page).to have_content('Coupon activated')
    first('#discount').set('test')
    click_button('Update cart')
    wait_for_ajax
    expect(page).to have_content('Coupon €0')
    expect(page).to have_content('Coupon deactivated')
  end
  
  scenario 'Should show the error message', js: true do
    first('#discount').set(Faker::Lorem.sentence(31))
    click_button('Update cart')
    wait_for_ajax
    expect(page).to have_content('An error has occurred')
  end
end