require 'rails_helper'

feature 'the cart inetface' do
  background do
    visit cart_path
  end

  context 'Dispalay content' do
    it 'should display the content of the cart' do
      %i(Cart Product Price Quanity SubTotal).each do |content|
        expect(page).to have_content(content)
      end
       expect(page).to have_field('coupon_code_text')
       expect(page).to have_button('Update cart')
       expect(page).to have_button('Checkout')
    end
  end
end 