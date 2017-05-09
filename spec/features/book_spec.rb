require 'rails_helper'

feature 'the book interface' do
  background do
    @book = create(:book).decorate
    visit book_path(@book.id)
  end
  context 'Display content' do
    it 'should display the attributes of the book' do
      expect(page).to have_content(@book.title)
      expect(page).to have_content(@book.price)
      expect(page).to have_content(@book.description)
      expect(page).to have_content(@book.authors_list)
      expect(page).to have_content(@book.materials_list)
      expect(page).to have_content(@book.dimension_attr)
      expect(page).to have_content(@book.year_publication)
    end
  
    it 'should be a short description and ... read more at startup', js: true do
      expect(page).to have_content("#{@book.description.slice(0...280)}... Read More")
    end
  end

  scenario 'deploy and hide description when user clicking on the link',js: true do
    click_link('Read More')
    expect(page).to have_content("#{@book.description}")
    expect(page).to have_content('Show less')
    expect(page).not_to have_content('Read More')

    click_link('Show less')
    expect(page).to have_content("#{@book.description.slice(0...280)}")
    expect(page).to have_content('... Read More')
    expect(page).not_to have_content('Show less')
  end
end