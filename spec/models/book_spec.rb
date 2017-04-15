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

  describe 'Quantity' do
    it { is_expected.to validate_numericality_of(:price) }
  end
end
