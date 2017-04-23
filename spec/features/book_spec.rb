require 'rails_helper'

describe 'the book interface' do
  before(:all) do
    @book = create(:book)
  end

  describe 'on the book page' do
    before(:each) do
      visit books_path
    end
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