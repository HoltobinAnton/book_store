require 'rails_helper'

feature 'the review interface' do
  background do
    @book = create(:book).decorate
    @user = create(:user)
    @review = create(:review, book: @book, user: @user)
    visit book_path(@book.id)
  end

  def fill_in_signin_fields
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'
  end


  scenario 'An unauthorized user must see the content' do
    expect(page).to have_content('Only registered users can leave reivews')
    expect(page).to have_content('Log in')
    #expect(@book.rev_count).to eq('Reviews (0)')
    #expect(page).to have_content(@user.email)
    #expect(page).to have_content("#{@review.created_at.strftime("%Y/%m/%d")} Verified Reviewer")
    #expect(page).to have_content(@review.description)
  end

  scenario 'create new review', js: true do
    click_link 'Log in'
    fill_in_signin_fields
    visit book_path(@book.id)
    expect(page).not_to have_content('Only registered users can leave reivews')
    expect{
      fill_in 'review_title', with: Faker::Lorem.sentence(2)
      fill_in 'review_description', with: Faker::Lorem.sentence(12)
      find("#star-rating-5").click
      click_button 'Post'
    }.to change{@book.reviews.count}.by(1)
    expect(page).to have_content('Thanks for Review. It will be published as soon as Admin will approve it')
  end

end

