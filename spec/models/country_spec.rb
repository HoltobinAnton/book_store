require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'Validation' do
    it 'is valid with valid attributes' do
      expect(create(:country)).to be_valid
    end
    it { is_expected.to validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(50) }

  end
end
