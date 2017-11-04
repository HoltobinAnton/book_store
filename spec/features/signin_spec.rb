require 'rails_helper'

feature 'signing in' do
  let(:user) { create(:user) }

  scenario 'visiting the site to sign in' do
    visit root_path
    click_link I18n.t('sign_in')
    fill_in_signin_fields(user.email, user.password)
    expect(page).to have_content('Signed in successfully')
  end

  scenario 'should show dropdown menu after sign in' do
    visit root_path
    click_link I18n.t('sign_in')
    fill_in_signin_fields(user.email, user.password)
    click_link 'My account'
    expect(page).not_to have_content('Sign in')
    expect(page).to have_content('Setting')
    expect(page).to have_content('My Orders')
    expect(page).to have_content('Admin panel')
    expect(page).to have_content('Log Out')
  end

  scenario 'shold not show drop down menu' do
    visit root_path
    expect(page).not_to have_content('My account')
  end
end