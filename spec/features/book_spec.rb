require 'rails_helper'

feature 'the book interface' do
  background do
    @book = create(:book).decorate
    visit book_path(@book.id)
  end

  it 'should display the attributes of the book' do
    expect(page).to have_content(@book.title)
    expect(page).to have_content(@book.price)
    expect(page).to have_content(@book.description)
    expect(page).to have_content(@book.authors_list)
    expect(page).to have_content(@book.materials_list)
    expect(page).to have_content(@book.dimension_attr)
    expect(page).to have_content(@book.year_publication)
  end
end