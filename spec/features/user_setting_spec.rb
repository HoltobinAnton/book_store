require 'rails_helper'

feature 'setting' do
  let(:user) { create :user }
  background do
    visit root_path
    click_link I18n.t('sign_in')
    fill_in_signin_fields(user.email, user.password)
    click_link I18n.t('my_account')
    click_link I18n.t('setting')
  end

  scenario 'should set a new email' do
    fill_in 'user[email]', with: 'newemail@gmail.com'
    click_button I18n.t('save_email')
    expect(current_path).to eq(root_path)
    expect(page).to have_content I18n.t('flash.user.success')
  end

  scenario 'should set a new password' do
    fill_in 'user[password]', with: 'q123456'
    fill_in 'user[password_confirmation]', with: 'q123456'
    click_button I18n.t('save_password')
    expect(current_path).to eq(root_path)
    expect(page).to have_content I18n.t('flash.user.success')
  end

  scenario 'should set a new address' do
    fill_in 'fname_bil', with: 'fristname'
    fill_in 'lname_bil', with: 'lastname'
    fill_in 'address_bil', with: 'street 13 hous 1t'
    fill_in 'city_bil', with: 'Dnepr'
    fill_in 'zip_bil', with: '134'
    fill_in 'phone_bil', with: '0954134771'
    click_button I18n.t('save_address')
    expect(current_path).to eq(root_path)
    expect(page).to have_content I18n.t('flash.user.success')
  end

  scenario 'should remove this account', js: true do
    click_link I18n.t('privacy')
    page.accept_confirm { click_button I18n.t('cancel_my_account') }
    expect(current_path).to eq(new_user_session_path)
  end
end