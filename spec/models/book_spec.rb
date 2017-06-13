require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'Validation' do
    it 'is valid with valid attributes' do 
      expect(create(:book)).to be_valid
    end
    describe 'can not be nil ( title, price, quantity )' do
      [:title, :price, :quantity].each do |attr|
        it { is_expected.to validate_presence_of(attr) }
      end
    end
  end

  describe 'Associations' do
    it { is_expected.to have_and_belong_to_many(:authors) }
    it { is_expected.to have_and_belong_to_many(:categories) }
    it { is_expected.to have_and_belong_to_many(:materials) }
    it { is_expected.to belong_to(:dimension) }
    it { is_expected.to have_many(:pictures) }
    it { is_expected.to have_many(:reviews) }
    it { is_expected.to have_many(:order_items) }
  end 

  describe 'Quantity' do
    it { is_expected.to validate_numericality_of(:price) }

    it 'Check count?' do 
      book = create(:book, quantity: 10)
      flag = book.check_count?(20)
      expect(flag).to be false
    end

    it 'Purchase of books' do
      book = create(:book, quantity: 30)
      book.purchase_of_book(25)
      expect(book.quantity).to equal(5)
    end

    it 'Should calculate the total price' do
      book = create(:book, price: 13.42)
      expect(book.total_price(10)).to eq(134.2)
    end
  end
end
