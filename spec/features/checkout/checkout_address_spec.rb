require 'rails_helper'

feature 'Address step' do
  let(:user) { create :user }
  let(:order) { create :order, user: user }

  background do
    visit root_path
    click_link I18n.t('sign_in')
    fill_in_signin_fields(user.email, user.password)
    allow_any_instance_of(CheckoutsController).to receive(:current_order)
      .and_return(order)
    allow_any_instance_of(CheckoutsController).to receive(:check_order_for_checkouts)
      .and_return(true)
  end

  scenario 'should pass validations', js: true do
    visit checkouts_path(id: :address)
    fill_in 'fname_bil', with: 'Anton'
    fill_in 'lname_bil', with: 'lastName'
    fill_in 'address_bil', with: 'str 13, ...'
    fill_in 'city_bil', with: 'Dnepr'
    fill_in 'zip_bil', with: '4122'
    fill_in 'phone_bil', with: '0954142144'
    first('span.checkbox-text').click
    wait_for_ajax
    expect { 
      click_button I18n.t('save_and_continue')
    }.to change(Address, :count).by(2)
    expect(page).to have_content('Updated successfully')
    expect(current_path).to eq('/checkouts/delivery')
  end

  scenario 'should not pass validations', js: true do
    visit checkouts_path(id: :address)
    fill_in 'fname_bil', with: 'Anton'
    fill_in 'lname_bil', with: 'lastName'
    fill_in 'address_bil', with: 'str 13, ...'
    first('span.checkbox-text').click
    wait_for_ajax
    expect { 
      click_button I18n.t('save_and_continue')
    }.not_to change(Address, :count)
    expect(page).to have_content('Incorect data')
    expect(current_path).to eq('/checkouts/address')
  end
end