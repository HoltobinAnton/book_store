require 'rails_helper'

feature 'the review interface' do
  background do
    @book = create(:book).decorate
    @user = create(:user)
    @review = create(:review, book: @book, user: @user)
    visit book_path(@book.id, locale: :en)
  end

  scenario 'An unauthorized user must see the content' do
    expect(page).to have_content I18n.t('check_review_text')
    expect(page).to have_content I18n.t('log_in')
  end

  scenario 'create new review', js: true do
    click_link I18n.t('log_in')
    fill_in_signin_fields(@user.email, @user.password)
    visit book_path(@book.id, locale: :en)
    expect(page).not_to have_content I18n.t('check_review_text')
    expect{
      fill_in 'review_title', with: Faker::Lorem.sentence(2)
      fill_in 'review_description', with: Faker::Lorem.sentence(12)
      find("#star-rating-5").click
      click_button I18n.t('post')
    }.to change{@book.reviews.count}.by(1)
    expect(page).to have_content I18n.t('flash.review.valid')
  end

end

