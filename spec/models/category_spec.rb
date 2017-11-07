require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validateion' do
    it 'is valid with valid attributes' do
      expect(create(:category)).to be_valid
    end
    it { is_expected.to validate_presence_of(:title) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:books) }
  end

  describe 'book vrom category' do
    let(:cat_first) { create :category }
    let(:books) { cat_first.books }
    let(:cat_last) { create :category }

    it 'should return true books from category' do
      expect(Category.books_from_category(cat_first.id)).to eq(books)
    end

    it 'should return false books from category' do
      expect(Category.books_from_category(cat_first.id)).not_to eq(cat_last.books)
    end
  end
end
