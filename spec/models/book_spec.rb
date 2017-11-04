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

  context 'scopes' do
    let(:book_three) { create :book, title: 'Zen...', price: 30, created_at: 3.day.ago  }
    let(:book_two) { create :book, title: 'GetPhone', price: 20, created_at: 2.day.ago  }
    let(:book_one) { create :book, title: 'AppleBook', price: 10, created_at: 1.day.ago }

    it 'should return books to sort by title: :asc' do
      Book.title_asc.should eq [book_one, book_two, book_three]
    end

    it 'should return books to sort by title: :desc' do
      Book.title_desc.should eq [book_three, book_two, book_one]
    end

    it 'should return books to sort by price: :asc' do
      Book.low_price.should eq [book_one, book_two, book_three]
    end

    it 'should return books to sort by price: :desc' do
      Book.high_price.should eq [book_three, book_two, book_one]
    end

    it 'should return books to sort by create_at: desc' do
      Book.new_books.should eq [book_one, book_two, book_three]
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
