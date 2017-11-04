require 'rails_helper'

feature 'signup' do
  let(:email) { 'test@gmail.com' }
  let(:pass) { 'q123456' }

  scenario 'create new user' do
    visit root_path
    click_link I18n.t('sign_up')
    fill_in_signup_fields(email, pass)
    expect(page).to have_content('You have signed up successfully')
    expect(page).not_to have_content I18n.t('sign_up')
    expect(page).to have_content I18n.t('setting')
    expect(page).to have_content I18n.t('my_orders')
    expect(page).to have_content I18n.t('log_out')
  end

end