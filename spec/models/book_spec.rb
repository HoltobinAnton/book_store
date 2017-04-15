require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'Validates' do
    it 'is valid with valid attributes' do 
      expect(Book.create).to be_valid
    end
    it 'can not be nil ( title, price, quantity )' do
      book = Book.create(title: '', price: '', quantity: '')
      expect(book).not_to be_valid
    end
    it 'is not valid without a quantity'
  end

end
