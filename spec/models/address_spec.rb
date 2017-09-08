require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'Validation' do
    it 'is valid with valid attributes' do
      expect(create(:address)).to be_valid
    end
    context 'can not be nil ( city, zip, phone )' do
      %i[address city zip phone].each do |attr|
        it { is_expected.to validate_presence_of(attr) }
      end
    end
    context 'must have a check' do
      it { should validate_length_of(:address).is_at_most(50) }
      it { should validate_length_of(:city).is_at_most(50) }
      it { should validate_length_of(:phone).is_at_most(15) }
      it { should allow_value('12312312').for(:phone) }
      it { should allow_value('61567').for(:zip) }
    end
  end

  describe 'Association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:country) }
  end
end
