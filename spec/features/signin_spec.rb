require 'rails_helper'

feature 'signing in' do
  let(:user) { create(:user) }

  def fill_in_signin_fields
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
  end

  scenario 'visiting the site to sign in' do
    visit root_path
    click_link 'Sign in'
    fill_in_signin_fields
    expect(page).to have_content('Signed in successfully')
  end

  scenario 'should show dropdown menu after sign in' do
    visit root_path
    click_link 'Sign in'
    fill_in_signin_fields
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