require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'create an address model' do
    it 'is valid with valid attributes' do
      expect(create(:address)).to be_valid
    end
  end

  describe 'Association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:country) }
  end
end
