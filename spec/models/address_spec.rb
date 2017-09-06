require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'Validation' do
    it 'is valid with valid attributes' do
      expect(create(:address)).to be_valid
    end
    context 'can not be nil ( city, zip, phone )' do
      [:address, :city, :zip, :phone].each do |attr|
        it { is_expected.to validate_presence_of(attr) }
      end
    end
  end

  describe 'Association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:order) }
    it { is_expected.to have_many(:countries) }
  end
  
end
